---
title: Copy Media File From One Site to Another Within a Multisite Network
date: "2016-05-05T18:21:54.121Z"
---

This class shows how to copy a file from one site to other sites within the same WordPress multisite network. This code uses [`wp_handle_sideload()`](https://developer.wordpress.org/reference/functions/wp_handle_sideload/) to copy the file to all the sites on the network without attaching them to posts. If you DO want to attach the file to a post when it is sideloaded, you may want to consider using [`media_sideload_image()`](https://developer.wordpress.org/reference/functions/media_sideload_image/) instead.

```php
class Copy_Media_File_To_Network_Sites {
	/**
	 * Constructor
	 */
	public function __construct() {
		$this->hooks();
	}

	/**
	 * Initiate our hooks
	 */
	public function hooks() {
		add_action( 'update_option_my_options_page_key', array( $this, 'update_department_images' ), 10, 2 );
	}

	/**
	 * Update department images on all sites in the network
	 *
	 * @since 0.1.0
	 * @param array $old_values The field values before being updated.
	 * @param array $new_values The field values after being updated.
	 */
	public function update_department_images( $old_values, $new_values ) {

		if ( ! is_array( $new_values ) ) {
			return;
		}

		if ( ! isset( $new_values[ 'dept_image_' . $post_id . '_id' ] ) ) {
			continue;
		}

		$attachment_id = $new_values[ 'dept_image_' . $post_id . '_id' ];

		// Insert media file into each site in the network.
		$this->insert_media_file_into_sites( $attachment_id );
	}

	/**
	 * Insert media file into all sites on the network
	 *
	 * @since 0.1.0
	 * @param int    $attachment_id The attachment ID of the file to insert.page.
	 */
	private function insert_media_file_into_sites( $attachment_id ) {

		if ( ! $attachment_id ) {
			return;
		}

		$file_path       = get_attached_file( $attachment_id );
		$file_url        = wp_get_attachment_url( $attachment_id );
		$file_type_data  = wp_check_filetype( basename( $file_path ), null );
		$file_type       = $file_type_data['type'];
		$timeout_seconds = 5;

		// Loop through sub-sites in network.
		foreach ( prefix_get_sites_in_network() as $blog_id => $blog_name ) {

			switch_to_blog( $blog_id );

			// Sideload media file.
			$sideload_result = $this->sideload_media_file( $file_url, $file_type, $timeout_seconds );

			// If an error occurred while trying to sideload the media file; continue to next blog.
			if ( ! $sideload_result || ! empty( $sideload_result['error'] ) ) {
				restore_current_blog();
				continue;
			}

			$new_file_path = $sideload_result['file'];
			$new_file_type = $sideload_result['type'];

			// Insert media file into uploads directory.
			$inserted_attachment_id = $this->insert_media_file( $new_file_path, $new_file_type );

			restore_current_blog();
		}
	}

	/**
	 * Sideload Media File
	 *
	 * @since 0.1.0
	 * @param string $file_url        The URL of the file to sideload.
	 * @param string $file_type       The file type of the file to sideload.
	 * @param int    $timeout_seconds The number of seconds to allow before sideloading times out.
	 * @return array                  On success, returns an associative array of file attributes. On failure, returns
	 *                                $overrides['upload_error_handler'](&$file, $message ) or array( 'error'=>$message ).
	 */
	private function sideload_media_file( $file_url, $file_type, $timeout_seconds ) {

		// Gives us access to the download_url() and wp_handle_sideload() functions.
		require_once( ABSPATH . 'wp-admin/includes/file.php' );

		// Download file to temp dir.
		$temp_file = download_url( $file_url, $timeout_seconds );

		if ( is_wp_error( $temp_file ) ) {
			return false;
		}

		// Array based on $_FILE as seen in PHP file uploads.
		$file = array(
			'name'     => basename( $file_url ),
			'type'     => $file_type,
			'tmp_name' => $temp_file,
			'error'    => 0,
			'size'     => filesize( $temp_file ),
		);

		$overrides = array(
			// Tells WordPress to not look for the POST form
			// fields that would normally be present, default is true,
			// we downloaded the file from a remote server, so there
			// will be no form fields.
			'test_form'   => false,

			// Setting this to false lets WordPress allow empty files – not recommended.
			'test_size'   => true,

			// A properly uploaded file will pass this test.
			// There should be no reason to override this one.
			'test_upload' => true,
		);

		// Move the temporary file into the uploads directory.
		return wp_handle_sideload( $file, $overrides );
	}

	/**
	 * Insert media file into the current site
	 *
	 * @since  0.1.0
	 * @param  string $file_path              The path to the media file.
	 * @param  string  $file_type             The mime type of the media file.
	 * @return int    $inserted_attachment_id The inserted attachment ID, or 0 on failure.
	 */
	private function insert_media_file( $file_path = '', $file_type = '' ) {

		if ( ! $file_path || ! $file_type ) {
			return;
		}

		// Get the path to the uploads directory.
		$wp_upload_dir = wp_upload_dir();

		// Prepare an array of post data for the attachment.
		$attachment_data = array(
			'guid'           => $wp_upload_dir['url'] . '/' . basename( $file_path ),
			'post_mime_type' => $file_type,
			'post_title'     => preg_replace( '/\.[^.]+$/', '', basename( $file_path ) ),
			'post_content'   => '',
			'post_status'    => 'inherit',
		);

		// Insert the attachment.
		$inserted_attachment_id   = wp_insert_attachment( $attachment_data, $file_path );
		$inserted_attachment_path = get_attached_file( $inserted_attachment_id );

		// Update the attachment metadata.
		$this->update_inserted_attachment_metadata( $inserted_attachment_id, $inserted_attachment_path );

		return $inserted_attachment_id;
	}

	/**
	 * Update inserted attachment metadata
	 *
	 * @since 0.1.0
	 * @param int    $inserted_attachment_id The inserted attachment ID.
	 * @param string $file_path              The path to the media file.
	 */
	private function update_inserted_attachment_metadata( $inserted_attachment_id, $file_path ) {

		// Make sure that this file is included, as wp_generate_attachment_metadata() depends on it.
		require_once( ABSPATH . 'wp-admin/includes/image.php' );

		// Generate metadata for the attachment and update the database record.
		$attach_data = wp_generate_attachment_metadata( $inserted_attachment_id, $file_path );
		wp_update_attachment_metadata( $inserted_attachment_id, $attach_data );
	}
}
```

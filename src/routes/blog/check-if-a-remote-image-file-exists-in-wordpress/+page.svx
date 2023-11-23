---
title: Check if a Remote Image File Exists in WordPress
date: "2018-06-27T15:48:25.121Z"
---

If you want to check if a remote image file exists on a WordPress site but don’t necessarily want to fetch or download that file, this lightweight helper function can be used for that purpose:

```php
/**
 * Check if a remote image file exists.
 *
 * @param  string $url The url to the remote image.
 * @return bool        Whether the remote image exists.
 */
function km_remote_image_file_exists( $url ) {
	$response = wp_remote_head( $url );

	return 200 === wp_remote_retrieve_response_code( $response );
}
```

## Example Usage

It can be used like this:

```php
$image_url = 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png';

if ( km_remote_image_file_exists( $url ) ) {
	echo 'The remote image exists! Hooray!';
} else {
	echo 'The remote image does not exist. Boooooo.';
}
```

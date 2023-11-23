---
title: Add unfiltered_html Capability to Admins or Editors in WordPress Multisite
date: "2016-09-13T20:16:57.121Z"
---

Per [this Trac ticket](https://core.trac.wordpress.org/ticket/23820), WP intentionally disallows adding the ‘unfiltered_html’ capability to any non-Super Admin users on the WordPress multisite network. This is due to potential security vulnerabilities that could result from doing to. As that ticket points out:

> Any user could add Javascript code to steal the login cookies of any visitor who runs a blog on the same site. The rogue user can then impersonate any of those users and wreak havoc.

If you just want those users to be able to insert things like YouTube video iframes, you could instead use WP’s built-in [embed shortcode](https://codex.wordpress.org/Embeds) to embed that content instead.

If that’s not enough, and you need to extend the `unfiltered_html` capability to non-Super Admins, the code below can be used to do that. Just be sure that you trust those users 100% – with great power comes great responsibility.

```php
/**
 * Enable unfiltered_html capability for Editors.
 *
 * @param  array  $caps    The user's capabilities.
 * @param  string $cap     Capability name.
 * @param  int    $user_id The user ID.
 * @return array  $caps    The user's capabilities, with 'unfiltered_html' potentially added.
 */
function km_add_unfiltered_html_capability_to_editors( $caps, $cap, $user_id ) {

	if ( 'unfiltered_html' === $cap && user_can( $user_id, 'editor' ) ) {
		$caps = [ 'unfiltered_html' ];
	}

	return $caps;
}
add_filter( 'map_meta_cap', 'km_add_unfiltered_html_capability_to_editors', 1, 3 );
```

Just change `editor` on line `13` with whichever user role you need to add the `unfiltered_html` capability to.

Props to Justin Tadlock for the code he posted on this thread.

You may also want to check out this plugin by Automattic that gives both Administrators and Editors the `unfiltered_html` capability on multisite installs:

[https://wordpress.org/plugins-wp/unfiltered-mu/](https://wordpress.org/plugins-wp/unfiltered-mu/)

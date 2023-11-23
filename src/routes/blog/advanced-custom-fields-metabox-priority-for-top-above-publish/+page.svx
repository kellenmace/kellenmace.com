---
title: Advanced Custom Fields Metabox Priority for Top, Above Publish
date: "2016-05-11T18:19:04.121Z"
---

By default, all Advanced Custom Fields metaboxes with a position/context of "side" are given a priority of "core" which means that they’ll be positioned below the WordPress Publish, Categories and Tags metaboxes, and possibly others. The function below can be used to bump up a priority of a metabox to "high" so that it appears at the very top of the side column (in two-column view).

```php
/**
 * Set Advanced Custom Fields metabox priority.
 *
 * @param  string  $priority    The metabox priority.
 * @param  array   $field_group The field group data.
 * @return string  $priority    The metabox priority, modified.
 */
function km_set_acf_metabox_priority( $priority, $field_group ) {

	if ( 'My Field Group' === $field_group['title'] ) {
		$priority = 'high';
	}

	return $priority;
}
add_filter( 'acf/input/meta_box_priority', 'km_set_acf_metabox_priority', 10, 2 );
```

Just be sure to change ‘My Field Group’ to the name of the Advanced Custom Fields field group whose priority you want to change.

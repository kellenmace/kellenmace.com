---
title: Check if User Exists by ID in WordPress
date: "2016-08-26T18:26:37.121Z"
---

WordPress has a built in `username_exists()` function to check if a user exists by their username, but there isn't a similar function for checking if a user exists by their user ID. I've seen posts online where folks suggest a way of doing that with a direct database query using `$wpdb`. While that works, the function below is a bit simpler and uses a native WordPress function to accomplish the same thing.

You can pass it the user ID to check and it will return `true` if that user exists, or `false` if not.

```php
/**
 * @param  int $user_id User ID.
 *
 * @return bool Whether the user exists.
 */
function does_user_exist( int $user_id ) : bool {
    return (bool) get_users( [ 'include' => $user_id, 'fields' => 'ID' ] );
}
```

<?php
/**
 * File containing DB session handler
 *
 * @copyright Copyright (C) 1999-2010 eZ Systems AS. All rights reserved.
 * @license http://ez.no/licenses/gnu_gpl GNU GPL v2
 * @version //autogentag//
 * @package lib
 */

/** DB session handler class
 *
 * @since 4.4.0
 * @package lib
 * @subpackage ezsession
 */

/** PHP session handler class
 * Does not register it self as opposed to most other handler, as the point is to let PHP handle most things
 *
 * @since 4.4.0
 */
class eZSessionHandlerPHP extends eZSessionHandler
{
    /**
     *  reimp (Does nothing, lets php handle sessions)
     */
    public function setSaveHandler()
    {
        return true;
    }

    /**
     *  reimp (Only uses php and callbacks)
     */
    public function regenerate( $updateBackendData = true )
    {
        $oldSessionId = session_id();
        session_regenerate_id();

        if ( $updateBackendData )
        {
            $db = eZDB::instance();
            $escOldKey = $db->escapeString( $oldSessionId );
            $escNewKey = $db->escapeString( session_id() );
            $escUserID = $db->escapeString( eZSession::userID() );
            eZSession::triggerCallback( 'regenerate_pre', array( $db, $escNewKey, $escOldKey, $escUserID ) );
            eZSession::triggerCallback( 'regenerate_post', array( $db, $escNewKey, $escOldKey, $escUserID ) );
        }
        return true;
    }

    /**
     *  reimp (not used in this handler)
     */
    public function read( $sessionId )
    {
        return false;
    }

    /**
     *  reimp (not used in this handler)
     */
    public function write( $sessionId, $sessionData )
    {
        return false;
    }

    /**
     *  reimp (not used in this handler)
     */
    public function destroy( $sessionId )
    {
        return false;
    }

   /**
     * reimp (not used in this handler)
     */
    public function gc( $maxLifeTime )
    {
        return false;
    }

   /**
     * reimp (not used in this handler)
     */
    public function cleanup()
    {
        $db = eZDB::instance();
        eZSession::triggerCallback( 'cleanup_pre', array( $db ) );
        eZSession::triggerCallback( 'cleanup_post', array( $db ) );
        return true;
    }

   /**
     * reimp (this handler does not use tables)
     */
    static public function usesDatabaseTable()
    {
        return false;
    }

}
?>
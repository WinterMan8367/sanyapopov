<?
    require_once('db_model.php');

    function get_user($phone)
    {
        $arr = [];
        $db = new MysqlModel();

        $arr = $db->goResultOnce("
            SELECT 
                * 
            FROM
                user
            WHERE
                phone = '$phone'
        ");

        return $arr;
    }

?>
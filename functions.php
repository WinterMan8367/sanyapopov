<?
    require_once('db_model.php');

    function registration($name, $phone, $password, $repeat_password)
    {
        if ($password == $repeat_password)
        {
            $phone = preg_replace('/[^0-9]/', "", $phone);
            
            $find_phone = get_user($phone);

            if ($find_phone == null)
            {
                $password_hash = password_hash($password, PASSWORD_BCRYPT);

                $arr = [];
                $db = new MysqlModel();
                $arr = $db->query("
                    INSERT INTO user(
                        `id`,
                        `name`,
                        `phone`,
                        `password_hash`,
                        `role`,
                        `point`
                    )
                    VALUES(
                        NULL,
                        '$name',
                        '$phone',
                        '$password_hash',
                        0,
                        0
                    )
                ");

                $autoriz = get_user_info($password_hash);

                return $autoriz;
            }
            else
            {
                return 'phone';
            }
        }
        else
        {
            return 'password';
        } 
    }

    function get_user_info($value)
    {
        $arr = [];
        $db = new MysqlModel();

        $arr = $db->goResultOnce("
            SELECT
                *
            FROM
                user
            WHERE
                password_hash = '$value' OR user.id = '$value'
        ");

        return $arr;
    }

    function authorization($phone, $password)
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

        if (!empty($arr))
        {
            $password_hash = $arr['password_hash'];
            $verify = password_verify($password, $password_hash);

            return $result = $verify == true ? $arr : false;
        }
        else
        {
            return false;
        }
    }

    function get_coupon($user_id)
    {
        $arr = [];
        $db = new MysqlModel();

        $arr = $db->goResult("
            SELECT 
                coupon_id,
                amount
            FROM
                coupon_for_user
            WHERE
                user_id = $user_id
        ");

        return $arr;
    }

    function get_product($id)
    {
        $product = [];
        $db = new MysqlModel();

        $product = $db->goResultOnce("
            SELECT
                *
            FROM
                product
            WHERE
                id = $id
        ");

        $ingredient = [];
        $ingredient = $db->goResult("
            SELECT
                i.name,
                i.compound
            FROM
                ingredient i,
                ingredient_for_product ifp,
                product p
            WHERE
                i.id = ifp.ingredient_id AND p.id = ifp.product_id AND p.id = $id
        ");

        $product['ingredient'] = $ingredient;

        return $product;
    }

    function get_all_products_in_category($category)
    {
        $all_products = [];
        $db = new MysqlModel();

        $all_products = $db->goResult("
            SELECT
                *
            FROM
                product
            WHERE
                category_id = $category
        ");

        return $all_products;
    }

?>
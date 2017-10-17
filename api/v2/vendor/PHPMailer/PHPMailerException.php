<?php
namespace Vendors\PHPMailer;
/**
 * PHPMailer exception handler
 * @package PHPMailer
 */
use \Exception;
class PHPMailerException extends Exception
{
    /**
     * Prettify error message output
     * @return string
     */
    public function errorMessage()
    {
        $errorMsg = '<strong>' . $this->getMessage() . "</strong><br />\n";
        return $errorMsg;
    }
}
<?php
include_once 'intialize.php';
require 'vendorr/autoload.php';
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

if(isset($_POST['save_excel_data']))
{
    $fileName = $_FILES['import_file']['name'];
    $file_ext = pathinfo($fileName, PATHINFO_EXTENSION);

    $allowed_ext = ['xls','csv','xlsx'];

    if(in_array($file_ext, $allowed_ext))
    {
        $inputFileNamePath = $_FILES['import_file']['tmp_name'];
        $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load($inputFileNamePath);
        $data = $spreadsheet->getActiveSheet()->toArray();

        $count = "1";
        foreach($data as $row)
        {
            if($count > 0)
            {
                $firstname = $row['0'];
                $middlename = $row['1'];
                $lastname = $row['2'];
                $gender = $row['3'];
                $contact = $row['4'];
                $email = $row['5'];
                $address = $row['6'];
                $other_info = $row['7'];

                $studentQuery = "INSERT INTO client_list (firstname,middlename,lastname,gender,dob,contact,email,address,other_info) VALUES ('$firstname','$middlename','$flastname','$gender','$contact','$email','$address','$other_info')";
                $result = mysqli_query($con, $studentQuery);
                $msg = true;
            }
            else
            {
                $count = "1";
            }
        }

        if(isset($msg))
        {
            $_SESSION['message'] = "Successfully Imported";
            header('Location: admin/leads/index.php');
            exit(0);
        }
        else
        {
            $_SESSION['message'] = "Not Imported";
            header('Location: admin/leads/index.php');
            exit(0);
        }
    }
    else
    {
        $_SESSION['message'] = "Invalid File";
        header('Location: admin/leads/index.php');
        exit(0);
    }
}
?>
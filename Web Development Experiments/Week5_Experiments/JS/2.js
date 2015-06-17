function EmailController($scope)
{
    $scope.emails = ["abc@xyz.com"];
    $scope.add = function ()
    {
        $scope.emails.push($scope.newemail);
        $scope.newemail = "";
    }
}
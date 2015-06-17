var pid = 1;


function FormController($scope) {

    $scope.personarray = [
        {
            id: 0, 'name': 'Atif Khan',
            'email': 'abc@xyz.com',
            'phone': '111-222-3333'
        }
    ];

    $scope.saveData = function () {

        if ($scope.newdata.id == null) {
            $scope.newdata.id = pid++;
            $scope.personarray.push($scope.newdata);
        }
        else {
            for (i in $scope.personarray) {
                if ($scope.personarray[i].id == $scope.newdata.id) {
                    $scope.personarray[i] = $scope.newdata;
                }
            }
        }

        $scope.newdata = {};
    }

    $scope.edit = function (id) {
        for (i in $scope.personarray) {
            if ($scope.personarray[i].id == id) {
                $scope.newdata = angular.copy($scope.personarray[i]);
            }
        }
    }

    $scope.delete = function (id) {
        for (i in $scope.personarray) {
            if ($scope.personarray[i].id == id) {
                $scope.personarray.splice(i, 1);
                $scope.newdata = {};
            }
        }

    }


  
}
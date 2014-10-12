define([

], function(){
    function CtrUser($scope,serviceAjax,growl){
            $scope.gotoPage = function(page){
            page = page == 'berikutnya' ? parseInt($scope.page) + 1 : page;
            serviceAjax.getDataFromServer('user','get_all_bypaging',+page)
                .then(function(data){
                    if (data) {
                        $scope.userlist         = data['data'];
                        $scope.page             = data['page'];
                        $scope.pagefirst        = data['pagefirst'];
                        $scope.pagelast         = data['pagelast'];
                        $scope.pagination       = data['pagination'];
                        $scope.$apply();
                    } else {

                    }
            });
        };

        $scope.gotoPage(1);
        
        }
    }
    // set to global
    window.CtrUser = CtrUser;

    return CtrUser;
});
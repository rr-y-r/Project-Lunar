define([

], function(){
    function CtrlProduct($scope,serviceAjax,localStorageService,growl){
        //set level
        $scope.level = localStorageService.get('user');
        $scope.gotoPage = function(page){
            page = page == 'next' ? parseInt($scope.page) + 1 : page;
            serviceAjax.getDataFromServer('product','get_all_bypaging',+page)
                .then(function(data){
                    if (data) {
                        $scope.product          = data['data'];
                        $scope.page             = data['page'];
                        $scope.pagefirst        = data['pagefirst'];
                        $scope.pagelast         = data['pagelast'];
                        $scope.pagination       = data['pagination'];
                        $scope.$apply();
                    } else {

                    }
                });
        };
       
    }
    // set to global
    window.CtrlProduct = CtrlProduct;

    return CtrlProduct;
});
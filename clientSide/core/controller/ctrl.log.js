define([

], function(){
    function CtrLog($scope,serviceAjax,localStorageService,growl){
        //set level
        $scope.level = localStorageService.get('user');
        $scope.gotoPage = function(page){
            page = page == 'next' ? parseInt($scope.page) + 1 : page;
            serviceAjax.getDataFromServer('date','get_all_bypaging',+page)
            .then(function(data){
                controller log..
            });
        };

    }
    // set to global
    window.CtrLog = CtrLog;

    return CtrLog;
});
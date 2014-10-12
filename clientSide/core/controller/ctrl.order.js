define([

], function(){
    function CtrlOrder($scope,serviceAjax,growl,$sce,localStorageService){
        // set type data object
        $scope.data = {};
        // tampung informasi user ke variabel user
        var user = localStorageService.get('user');
        $scope.data.userid = user[0]['uID'];
        $scope.judulform = 'Choose';
        $scope.indikatorform = 'width: 0%';
        //ambil data shuttle tujuan
        serviceAjax.getDataFromServer('product','get_groupbyStore',$scope.actions)
            .then(function(data){
                if (data) {
                    $scope.pName        = data['name'];
                    $scope.$apply();
                }
        });
        //load data harga
        serviceAjax.getDataFromServer('price')
            .then(function(data){
                if (data) {
                  $scope.data.harga = data[0]['price'];
                  $scope.$apply();
                }
            });
        $scope.isNumber = function(n){
            if(!isNaN(parseFloat(n)) && isFinite(n)){

            }else{
                $scope.data.jumlah ='';
                growl.addWarnMessage('Jumlah Hanya Boleh Angka !',{ttl: 2000});
            }

        };
    }

    // set to global
    window.CtrlOrder = CtrlOrder;

    return CtrlOrder;
});
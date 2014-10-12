define([

], function(){
    function Ctrlhome($scope,$timeout,serviceAjax,localStorageService,growl){
        //set level
        $scope.level = localStorageService.get('user');
        $scope.date  = {};
        $scope.price = {};
        // load data jam keberangkatan
        serviceAjax.getDataFromServer('date','get_all')
            .then(function(data){
                if (data) {
                    $scope.date = data;
                    $scope.$apply();
                }
        });

        //load data harga
        serviceAjax.getDataFromServer('price')
            .then(function(data){
                if (data) {
                    $scope.harga = data[0];
                    $scope.$apply();
                }
        });

        //function update harga tiket
        $scope.changeharga = function(){
            $scope.loading = true;
            serviceAjax.posDataToServer('price','update',$scope.harga).then(function(data){
                if(data){
                    $timeout(function(){
                        $scope.loading = false;
                        growl.addSuccessMessage('Successfully editing price',{ttl: 2000});
                    },2000);
                   }
            });
        };
        //function update password
        $scope.changePassword = function(){
            if($scope.password == $scope.repeatpassword && $scope.password != undefined ){
                $scope.loadingp = true;
                $scope.datapassword = {
                    'userid'   : $scope.level[0]['uID'],
                    'password' : $scope.password
                };
                serviceAjax.posDataToServer('user','changepassword',$scope.datapassword).then(function(data){
                    if(data){
                        $timeout(function(){
                            $scope.loadingp = false;
                            growl.addSuccessMessage('Successfully editing password',{ttl: 2000});
                            $scope.password ='';
                            $scope.repeatpassword ='';
                        },2000);
                    }
                });
            }else{
                growl.addWarnMessage('Password isn,t same' !',{ttl: 2000});
            }


        };
        // Update function
    }

    // set to global
    window.Ctrlhome = Ctrlhome;

    return Ctrlhome;
});
var myApp = angular.module('motherHouse', ['ngRoute','ngTable','ui.router']);

myApp.controller('AddAgentCtrl', function(WebService,$state) {
    var vm = this;
    vm.agent = {
        customId: '',
        name: '',
        contact: '',
        countryId: '',
        "mainAgentId": "1"
    };
    
    if($state.params.agetId) {
        console.log('0000000000000');
        vm.title = "Edit Agent"
        var reqestObject = {
            method: 'GET',
            url: '/api/v1/agents/' + $state.params.agetId
        }
       var reqest = WebService.callWebService(reqestObject);
       reqest.then(function(data){
           var agent = data.data;
           vm.agent.id = agent.id; 
           vm.agent.customId = agent.customId;
           vm.agent.name = agent.name;
           vm.agent.contact = agent.contact;
           vm.agent.countryId = agent.countryId;
       });
       vm.addAgent = function() {
        var reqestObject = {
            method: 'PUT',
            url: '/api/v1/agents/'+ vm.agent.id,
            headers: {
                'Content-Type': 'application/json'
            },
            data: {requestdata : vm.agent}
        }
        var reqest = WebService.callWebService(reqestObject);

        reqest.then(function(data) {
            console.log(data)
        })
    }
    }else{
        vm.title = "Add New Agent"
        vm.addAgent = function() {
        var reqestObject = {
            method: 'POST',
            url: '/api/v1/agents',
            headers: {
                'Content-Type': 'application/json'
            },
            data: {requestdata : vm.agent}
        }
        var reqest = WebService.callWebService(reqestObject);

        reqest.then(function(data) {
            console.log(data)
        })
       }       
    }

});

myApp.controller('AddOrderCtrl', function(){
    var vm = this;
    vm.order = {
        agentId : '',
        receivingAgentId : '',
        orderAmount : '',
        orderCurrId : '',
        supplyCurrId : '',
        exchangeRate : '',
        orderStatus : '',
        name : '',
        contact : '',
        countryId : '',
        bank : '',
        branch : '',
        accountNumber : ''
    };
});
myApp.controller('agentListCtrl', function(AgentListService,NgTableParams,WebService,$state) {
    var vm = this;
    var loadAgents = function(){
        var promis = AgentListService.getAgentList();
        promis.then(function(responseData){
            vm.data = responseData.data;
            vm.tableParams = new NgTableParams({count: vm.data.length}, { counts: [], data: vm.data });
        });
    } 
    
    loadAgents();
    vm.delete = function(agetId) {
        var reqestObject = {
            method: 'DELETE',
            url: '/api/v1/agents/' + agetId
        }
       var reqest = WebService.callWebService(reqestObject);
       reqest.then(function(data){
           loadAgents();
       });
    }
    
    vm.edit = function(agetId) {
        $state.go('addAgent',{'agetId':agetId});
    }
    
    vm.addNewAgent = function(agetId) {
        $state.go('addAgent');
    }
});

myApp.factory('WebService',function($http){
    return {
        callWebService: function(reqestObject) {
            return $http(reqestObject);
        }
    }
});

myApp.factory('AgentListService', function($http) {
    return {

        getAgentList: function() {
            return $http({
                method: 'GET',
                url: '/api/v1/agents'
            });
        }
    }

});

myApp.config(function($stateProvider, $urlRouterProvider) {
  //
  // For any unmatched url, redirect to /state1
  $urlRouterProvider.otherwise("/addOrder");
  //
  // Now set up the states
  $stateProvider
    .state('addAgent', {
      url: "/addAgent/:agetId",
      params:{agetId:undefined},
      templateUrl: "/client/templates/addAgent.html"
    })
    .state('agentList', {
      url: "/agentList",
      templateUrl: '/client/templates/agentList.html'
    })
    .state('addOrder', {
      url: "/addOrder",
      templateUrl: "/client/templates/addOrder.html"
    });
});
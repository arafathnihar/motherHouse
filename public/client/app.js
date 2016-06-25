var myApp = angular.module('motherHouse', ['ui.bootstrap', 'ngTable', 'ui.router']);

myApp.controller('AddAgentCtrl', function(WebService, $state) {
    var vm = this;
    vm.agent = {
        customId: '',
        name: '',
        contact: '',
        countryId: '',
        "mainAgentId": "1"
    };

    if ($state.params.agetId) {
        vm.title = "Edit Agent"
        var reqestObject = {
            method: 'GET',
            url: '/api/v1/agents/' + $state.params.agetId
        }
        var reqest = WebService.callWebService(reqestObject);
        reqest.then(function(data) {
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
                url: '/api/v1/agents/' + vm.agent.id,
                headers: {
                    'Content-Type': 'application/json'
                },
                data: { requestdata: vm.agent }
            }
            var reqest = WebService.callWebService(reqestObject);

            reqest.then(function(data) {
                console.log(data)
            })
        }
    } else {
        vm.title = "Add New Agent"
        vm.addAgent = function() {
            var reqestObject = {
                method: 'POST',
                url: '/api/v1/agents',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: { requestdata: vm.agent }
            }
            var reqest = WebService.callWebService(reqestObject);

            reqest.then(function(data) {
                console.log(data)
            })
        }
    }

});

myApp.controller('AddOrderCtrl', function() {
    var vm = this;
    vm.order = {
        agentId: '',
        receivingAgentId: '',
        orderAmount: 0,
        orderCurrId: '',
        supplyCurrId: '',
        exchangeRate: '',
        orderStatus: '',
        name: '',
        contact: '',
        countryId: '',
        bank: '',
        branch: '',
        accountNumber: '',
        unitPrice: 0
    };
    
    var datepickerConf = function(obj) {
        obj.today = function() {
            obj.date = new Date();
        };

        obj.clear = function() {
            obj.Date = null;
        };

        obj.dateOptions = {
            formatYear: 'yy',
            maxDate: new Date(2020, 5, 22),
            minDate: new Date(),
            startingDay: 1
        };

        obj.dateOpen = function() {
            obj.datePopup.opened = true;
        };

        obj.datePopup = {
            opened: false
        };

    };
    vm.order = {};
    datepickerConf(vm.order);
    vm.settled = {};
    datepickerConf(vm.settled);
    vm.order.today();
    vm.settled.today();


});
myApp.controller('agentListCtrl', function(NgTableParams, WebService, $state) {
    var vm = this;
    var loadAgents = function() {
        var reqestObject = {
            method: 'GET',
            url: '/api/v1/agents'
        }
        var reqest = WebService.callWebService(reqestObject);
        reqest.then(function(responseData) {
            vm.data = responseData.data;
            vm.tableParams = new NgTableParams({ count: vm.data.length }, { counts: [], data: vm.data });
        });
    }

    loadAgents();
    vm.delete = function(agetId) {
        var reqestObject = {
            method: 'DELETE',
            url: '/api/v1/agents/' + agetId
        }
        var reqest = WebService.callWebService(reqestObject);
        reqest.then(function(data) {
            loadAgents();
        });
    }

    vm.edit = function(agetId) {
        $state.go('addAgent', { 'agetId': agetId });
    }

    vm.addNewAgent = function(agetId) {
        $state.go('addAgent');
    }
});

myApp.controller('orderListCtrl', function($state) {
    var vm = this;
    var loadAgents = function() {
        var promis = AgentListService.getAgentList();
        promis.then(function(responseData) {
            vm.data = responseData.data;
            vm.tableParams = new NgTableParams({ count: vm.data.length }, { counts: [], data: vm.data });
        });
    }

    loadAgents();
    vm.delete = function(agetId) {
        var reqestObject = {
            method: 'DELETE',
            url: '/api/v1/agents/' + agetId
        }
        var reqest = WebService.callWebService(reqestObject);
        reqest.then(function(data) {
            loadAgents();
        });
    }

    vm.edit = function(agetId) {
        $state.go('addAgent', { 'agetId': agetId });
    }

    vm.addNewOrder = function(agetId) {
        $state.go('addOrder');
    }
});

myApp.factory('WebService', function($http) {
    return {
        callWebService: function(reqestObject) {
            return $http(reqestObject);
        }
    }
});


myApp.config(function($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise("/addOrder");
    $stateProvider
        .state('addAgent', {
            url: "/addAgent/:agetId",
            params: { agetId: undefined },
            templateUrl: "/client/templates/addAgent.html"
        })
        .state('agentList', {
            url: "/agentList",
            templateUrl: '/client/templates/agentList.html'
        })
        .state('orderList', {
            url: "/orderList",
            templateUrl: '/client/templates/orderList.html'
        })
        .state('addOrder', {
            url: "/addOrder",
            templateUrl: "/client/templates/addOrder.html"
        });
});
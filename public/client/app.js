var myApp = angular.module('motherHouse', ['ui.bootstrap', 'ngTable', 'ui.router']);

var agentList;
var receivingAgentList;
var countries;
var currencies;

myApp.controller('AddAgentCtrl', function(WebService, UtilityService, $state) {
    var vm = this;
    vm.agent = {
        customId: '',
        name: '',
        contact: '',
        countryId: '',
        "mainAgentId": "1"
    };
    if (!countries) {
        countryReqest = UtilityService.getCountries();
        countryReqest.then(function(data) {
            countries = data.data;
            vm.countries = countries;
        });
    } else {
        vm.countries = countries;
    }
    if ($state.params.agetId) {
        vm.title = "Edit Agent"
        var agentReqestObject = {
            method: 'GET',
            url: '/api/v1/agents/' + $state.params.agetId
        }
        var agentReqest = WebService.callWebService(agentReqestObject);
        agentReqest.then(function(data) {
            var agent = data.data;
            vm.agent.id = agent.id;
            vm.agent.customId = agent.customId;
            vm.agent.name = agent.name;
            vm.agent.contact = agent.contact;
            vm.agent.countryId = agent.countryId;
        });
        vm.addAgent = function() {
            var updateAgentReqestObject = {
                method: 'PUT',
                url: '/api/v1/agents/' + vm.agent.id,
                headers: {
                    'Content-Type': 'application/json'
                },
                data: { requestdata: vm.agent }
            }
            var updateAgentReqest = WebService.callWebService(updateAgentReqestObject);

            updateAgentReqest.then(function(data) {
                console.log(data)
            })
        }
    } else {
        vm.title = "Add New Agent"
        vm.addAgent = function() {
            var addAgentReqestObject = {
                method: 'POST',
                url: '/api/v1/agents',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: { requestdata: vm.agent }
            }
            var addAgentReqest = WebService.callWebService(addAgentReqestObject);

            addAgentReqest.then(function(data) {
                console.log(data)
            })
        }
    }

});
myApp.controller('AddReceivingAgentCtrl', function(UtilityService, WebService, $state) {
    var vm = this;

    if (!countries) {
        countryReqest = UtilityService.getCountries();
        countryReqest.then(function(data) {
            countries = data;
            vm.countries = countries;
        });
    } else {
        vm.countries = countries;
    }
    vm.receivingagent = {
        customId: '',
        name: '',
        contact: '',
        countryId: '',
        "mainAgentId": "1"
    };

    if ($state.params.receivingagentId) {
        vm.title = "Edit Receiving Agent"
        var reqestObject = {
            method: 'GET',
            url: '/api/v1/receiving_agents/' + $state.params.receivingagentId
        }
        var reqest = WebService.callWebService(reqestObject);
        reqest.then(function(data) {
            var receivingagent = data.data;
            vm.receivingagent.id = receivingagent.id;
            vm.receivingagent.customId = receivingagent.customId;
            vm.receivingagent.name = receivingagent.name;
            vm.receivingagent.contact = receivingagent.contact;
            vm.receivingagent.countryId = receivingagent.countryId;
        });
        vm.addReceivingAgent = function() {
            var reqestObject = {
                method: 'PUT',
                url: '/api/v1/receiving_agents/' + vm.receivingagent.id,
                headers: {
                    'Content-Type': 'application/json'
                },
                data: { requestdata: vm.receivingagent }
            }
            var reqest = WebService.callWebService(reqestObject);

            reqest.then(function(data) {
                console.log(data)
            });
        }
    } else {
        vm.title = "Add New Receiving Agent"
        vm.addReceivingAgent = function() {
            var reqestObject = {
                method: 'POST',
                url: '/api/v1/receiving_agents',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: { requestdata: vm.receivingagent }
            }
            var reqest = WebService.callWebService(reqestObject);

            reqest.then(function(data) {
                console.log(data)
            })
        }
    }
});
myApp.controller('AddOrderCtrl', function(UtilityService) {
    var vm = this;
    vm.order = {
        agentId: '',
        receivingAgentId: '',
        orderAmount: 0,
        orderCurrId: '',
        supplyCurrId: '',
        exchangeRate: 0,
        orderStatus: '',
        name: '',
        contact: '',
        countryId: '',
        bank: '',
        branch: '',
        accountNumber: ''
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
    if (agentList) {
        vm.agents = agentList;
    } else {
        var agents = UtilityService.getAgentList();
        agents.then(function(data) {
            vm.agents = data;
        });
    }
    if (receivingAgentList) {
        vm.receivingAgents = receivingAgentList;
    } else {
        var receivingAgents = UtilityService.getReceivingAgentList();
        receivingAgents.then(function(data) {
            vm.receivingAgents = data;
        });
    }
    if (!currencies) {
        countryReqest = UtilityService.getCurrencies();
        countryReqest.then(function(data) {
            currencies = data;
            vm.currencies = currencies;
        });
    } else {
        vm.currencies = currencies;
    }
    if (!countries) {
        countryReqest = UtilityService.getCountries();
        countryReqest.then(function(data) {
            countries = data;
            vm.countries = countries;
        });

    } else {
        vm.countries = countries;
    }
});

myApp.controller('agentListCtrl', function(UtilityService, NgTableParams, WebService, $state) {
    var vm = this;
    if (!countries) {
        countryReqest = UtilityService.getCountries();
        countryReqest.then(function(data) {
            countries = data;
            vm.countries = countries;
        });
    } else {
        vm.countries = countries;
    }
    var loadAgents = function() {
        var agents = UtilityService.getAgentList();
        agents.then(function(data) {
            agentList = data;
            vm.data = agentList;
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
myApp.controller('receivingAgentListCtrl', function(UtilityService, NgTableParams, WebService, $state) {
    var vm = this;
    var loadReceivingAgents = function() {
        var receivingAgents = UtilityService.getReceivingAgentList();
        receivingAgents.then(function(data) {
            receivingAgentList = data;
            vm.data = receivingAgentList;
            vm.tableParams = new NgTableParams({ count: vm.data.length }, { counts: [], data: vm.data });
        });
    }

    loadReceivingAgents();
    vm.delete = function(receivingAgentId) {
        var reqestObject = {
            method: 'DELETE',
            url: '/api/v1/receiving_agents/' + receivingAgentId
        }
        var reqest = WebService.callWebService(reqestObject);
        reqest.then(function(data) {
            loadReceivingAgents();
        });
    }

    vm.edit = function(receivingAgentId) {
        $state.go('addReceivingAgent', { 'receivingAgentId': receivingAgentId });
    }

    vm.addReceivingAgent = function(agetId) {
        $state.go('addReceivingAgent');
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

myApp.factory('UtilityService', function(WebService) {
    return {
        getCountries: function() {
            var countryReqestObject = {
                method: 'GET',
                url: '/commons/countries/'
            }
            var countryReqest = WebService.callWebService(countryReqestObject).then(function(data) {
                return data.data;
            });
            return countryReqest;
        },
        getAgentList: function() {
            var agentListReqestObject = {
                method: 'GET',
                url: '/api/v1/agents'
            }
            var agentListReqest = WebService.callWebService(agentListReqestObject).then(function(responseData) {
                return responseData.data
            });
            return agentListReqest;
        },
        getCurrencies: function() {
            var currencyReqestObject = {
                method: 'GET',
                url: '/commons/currencies/'
            }
            var currencyReqest = WebService.callWebService(currencyReqestObject).then(function(data) {
                return data.data;
            });
            return currencyReqest;
        },
        getReceivingAgentList: function() {
            var receivingAgentListReqestObject = {
                method: 'GET',
                url: '/api/v1/receiving_agents'
            }
            var receivingAgentListReqest = WebService.callWebService(receivingAgentListReqestObject).then(function(data) {
                return data.data;
            });
            return receivingAgentListReqest
        }
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
    $urlRouterProvider.otherwise("/addReceivingAgent");
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
        })
        .state('addReceivingAgent', {
            url: "/addReceivingAgent/:receivingAgentId",
            params: { receivingAgentId: undefined },
            templateUrl: "/client/templates/addReceivingAgent.html"
        })
        .state('receivingAgentList', {
            url: "/receivingAgentList",
            templateUrl: '/client/templates/receivingAgentList.html'
        });
});
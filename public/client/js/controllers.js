var myApp = angular.module('motherHouseControllers', []);

var agentList;
var receivingAgentList;
var ordersList;
var countries;
var currencies;
var currenciesKeyVal;

myApp.controller('AddAgentCtrl', function(WebService, UtilityService, $state) {
    var vm = this;
    vm.agent = {
        customId: '',
        name: '',
        contact: '',
        country_id: '',
        "main_agent_id": "1"
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
            vm.agent.country_id = agent.country_id;
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
        country_id: '',
        "main_agent_id": "1"
    };

    if ($state.params.receivingAgentId) {
        vm.title = "Edit Receiving Agent"
        var reqestObject = {
            method: 'GET',
            url: '/api/v1/receiving_agents/' + $state.params.receivingAgentId
        }
        var reqest = WebService.callWebService(reqestObject);
        reqest.then(function(data) {
            var receivingagent = data.data;
            vm.receivingagent.id = receivingagent.id;
            vm.receivingagent.customId = receivingagent.customId;
            vm.receivingagent.name = receivingagent.name;
            vm.receivingagent.contact = receivingagent.contact;
            vm.receivingagent.country_id = receivingagent.country_id;
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
myApp.controller('AddOrderCtrl', function(UtilityService, WebService) {
    var vm = this;
    vm.order = {
        agent_id: '',
        receiving_agent_id: '',
        orderAmount: 0,
        order_curr_id: '',
        supply_curr_id: '',
        exchangeRate: 0,
        orderDate: '',
        orderStatus: 1,
        suppliedDate: '',
        completedDate: '',
        name: '',
        contact: '',
        country_id: '',
        bankName: '',
        branchName: '',
        bankAcNo: ''
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
    vm.completed = {};
    datepickerConf(vm.completed);
    vm.order.today();
    vm.settled.today();
    vm.completed.today();
    vm.order.orderDate = new Date();
    vm.order.suppliedDate = new Date();
    vm.order.completedDate = new Date();
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

    vm.addOrder = function() {
        var addOrderReqestObject = {
            method: 'POST',
            url: '/api/v1/orders',
            headers: {
                'Content-Type': 'application/json'
            },
            data: { requestdata: vm.order }
        }
        var addOrderReqest = WebService.callWebService(addOrderReqestObject);

        addOrderReqest.then(function(data) {
            console.log(data)
        })
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
myApp.controller('orderListCtrl', function(UtilityService, NgTableParams, WebService, $state) {
    var vm = this;
    // if (!countries) {
    //     countryReqest = UtilityService.getCountries();
    //     countryReqest.then(function(data) {
    //         countries = data;
    //         vm.countries = countries;
    //     });
    // } else {
    //     vm.countries = countries;
    // }
    // debugger;
    var loadOrders = function() {
        var orders = UtilityService.getOrderList();
        orders.then(function(data) {
            ordersList = data[0];
            vm.data = ordersList;
            console.log(vm.data);
            vm.tableParams = new NgTableParams({ count: vm.data.length }, { counts: [], data: vm.data });
        });
    }

    loadOrders();
    vm.delete = function(orderId) {
        var reqestObject = {
            method: 'DELETE',
            url: '/api/v1/orders/' + orderId
        }
        var reqest = WebService.callWebService(reqestObject);
        reqest.then(function(data) {
            loadOrders();
        });
    }

    vm.edit = function(orderId) {
        $state.go('addOrder', { 'orderId': orderId });
    }

    vm.addNewAgent = function(agetId) {
        $state.go('addOrder');
    }
});
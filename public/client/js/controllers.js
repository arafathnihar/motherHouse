var myApp = angular.module('motherHouseControllers', ['ngToast']);

var agentList;
var receivingAgentList;
var ordersList;
var countries;
var currencies;
var currenciesKeyVal;
var mainAccounts;

myApp.controller('AddAgentCtrl', function(WebService, UtilityService, $state, ngToast) {
    var vm = this;
    vm.agent = {
        customId: '',
        name: '',
        contact: '',
        country_id: ''
    };
    if (!countries) {
        countryRequest = UtilityService.getCountries();
        countryRequest.then(function(data) {
            countries = data;
            vm.countries = countries;
        });
    } else {
        vm.countries = countries;
    }
    if ($state.params.agentId) {
        vm.title = "Edit Agent"
        var agentRequestObject = {
            method: 'GET',
            url: '/api/v1/agents/' + $state.params.agentId
        }
        var agentRequest = WebService.callWebService(agentRequestObject);
        agentRequest.then(function(data) {
            var agent = data.data;
            vm.agent.id = agent.id;
            vm.agent.customId = agent.customId;
            vm.agent.name = agent.name;
            vm.agent.contact = agent.contact;
            vm.agent.country_id = agent.country_id;
        });
        vm.addAgent = function() {
            var updateAgentRequestObject = {
                method: 'PUT',
                url: '/api/v1/agents/' + vm.agent.id,
                headers: {
                    'Content-Type': 'application/json'
                },
                data: { requestdata: vm.agent }
            }
            var updateAgentRequest = WebService.callWebService(updateAgentRequestObject);

            updateAgentRequest.then(function(data) {
                ngToast.create({
                    className: 'info',
                    dismissButton: true,
                    timeout: 5000,
                    content: 'Agent ' + vm.agent.customId + ' ('+ vm.agent.name +') updated successfully !!!'
                });
                $state.go('agentList');
            })
        }
    } else {
        vm.title = "Add New Agent"
        vm.addAgent = function() {
            var addAgentRequestObject = {
                method: 'POST',
                url: '/api/v1/agents',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: { requestdata: vm.agent }
            }
            var addAgentRequest = WebService.callWebService(addAgentRequestObject);

            addAgentRequest.then(function(data) {
                ngToast.create({
                    className: 'info',
                    dismissButton: true,
                    timeout: 5000,
                    content: 'Agent added successfully !!!'
                });
                vm.agent.customId = '';
                vm.agent.name = '';
                vm.agent.contact = '';
                vm.agent.country_id = '';
            })
        }
    }

});

myApp.controller('AddReceivingAgentCtrl', function(UtilityService, WebService, $state, ngToast) {
    var vm = this;

    if (!countries) {
        countryRequest = UtilityService.getCountries();
        countryRequest.then(function(data) {
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
        country_id: ''
    };

    if ($state.params.receiving_agent_id) {
        vm.title = "Edit Receiving Agent"
        var requestObject = {  
            method: 'GET',
            url: '/api/v1/receiving_agents/' + $state.params.receiving_agent_id
        }
        var request = WebService.callWebService(requestObject);
        request.then(function(data) {
            var receivingagent = data.data;
            vm.receivingagent.id = receivingagent.id;
            vm.receivingagent.customId = receivingagent.customId;
            vm.receivingagent.name = receivingagent.name;
            vm.receivingagent.contact = receivingagent.contact;
            vm.receivingagent.country_id = receivingagent.country_id;
        });
        vm.addReceivingAgent = function() {
            var requestObject = {
                method: 'PUT',
                url: '/api/v1/receiving_agents/' + vm.receivingagent.id,
                headers: {
                    'Content-Type': 'application/json'
                },
                data: { requestdata: vm.receivingagent }
            }
            var request = WebService.callWebService(requestObject);

            request.then(function(data) {
                ngToast.create({
                    className: 'info',
                    dismissButton: true,
                    timeout: 5000,
                    content: 'Receiving Agent ' + vm.receivingagent.customId + ' ('+ vm.receivingagent.name +') updated successfully !!!'
                });
                $state.go('receivingAgentList');
            });
        }
    } else {
        vm.title = "Add New Receiving Agent"
        vm.addReceivingAgent = function() {
            var requestObject = {
                method: 'POST',
                url: '/api/v1/receiving_agents',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: { requestdata: vm.receivingagent }
            }
            var request = WebService.callWebService(requestObject);

            request.then(function(data) {
                ngToast.create({
                    className: 'info',
                    dismissButton: true,
                    timeout: 5000,
                    content: 'Receiving agent added successfully !!!'
                });
                vm.receivingagent.customId = '';
                vm.receivingagent.name = '';
                vm.receivingagent.contact = '';
                vm.receivingagent.country_id = '';
            })
        }
    }
});

myApp.controller('AddOrderCtrl', function(UtilityService, WebService, $state, ngToast) {
    var vm = this;
    vm.order = {
        customId: '',
        agent_id: '',
        receiving_agent_id: '',
        orderAmount: 0,
        order_curr_id: '',
        supply_curr_id: '',
        exchangeRate: 0,
        orderDate: '',
        orderStatus: 1,
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
    vm.order.today();
    vm.order.orderDate = new Date();

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
        countryRequest = UtilityService.getCurrencies();
        countryRequest.then(function(data) {
            currencies = data;
            vm.currencies = currencies;
        });
    } else {
        vm.currencies = currencies;
    }
    if (!countries) {
        countryRequest = UtilityService.getCountries();
        countryRequest.then(function(data) {
            countries = data;
            vm.countries = countries;
        });

    } else {
        vm.countries = countries;
    }

    if($state.params.orderId){
        vm.title = "Edit order"
        var requestObject = {
            method: 'GET',
            url: '/api/v1/orders/' + $state.params.orderId
        }
        var request = WebService.callWebService(requestObject);
        request.then(function(data) {
            var order = data.data;
            vm.order.id = order.id;
            vm.order.customId = order.customId;
            vm.order.agent_id = order.agent_id;
            vm.order.receiving_agent_id = order.receiving_agent_id;
            vm.order.orderAmount = order.orderAmount;
            vm.order.order_curr_id = order.order_curr_id;
            vm.order.supply_curr_id = order.supply_curr_id;
            vm.order.exchangeRate = order.exchangeRate;
            vm.order.name = order.receiver.name;
            vm.order.contact = order.receiver.contact;
            vm.order.country_id = order.receiver.country_id;
            vm.order.bankName = order.receiver.bankName;
            vm.order.branchName = order.receiver.branchName;
            vm.order.bankAcNo = order.receiver.bankAcNo;

        });
        vm.addOrder = function() {
            var requestObject = {
                method: 'PUT',
                url: '/api/v1/orders/' + vm.order.id,
                headers: {
                    'Content-Type': 'application/json'
                },
                data: { requestdata: vm.order }
            }
            var request = WebService.callWebService(requestObject);

            request.then(function(data) {
                ngToast.create({
                    className: 'info',
                    dismissButton: true,
                    timeout: 5000,
                    content: 'Order ' + vm.order.customId + ' updated successfully !!!'
                });
                $state.go('orderList');
            });
        }
    } else{
        vm.title = "Add New Order"
        vm.addOrder = function() {
            var addOrderRequestObject = {
                method: 'POST',
                url: '/api/v1/orders',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: { requestdata: vm.order }
            }
            var addOrderRequest = WebService.callWebService(addOrderRequestObject);

            addOrderRequest.then(function(data) {
                ngToast.create({
                    className: 'info',
                    dismissButton: true,
                    timeout: 5000,
                    content: 'Order added successfully !!!'
                });
                vm.order.agent_id = '';
                vm.order.receiving_agent_id = '';
                vm.order.orderAmount = '';
                vm.order.order_curr_id = '';
                vm.order.supply_curr_id = '';
                vm.order.exchangeRate = '';
                vm.order.totalAmount = '';
                vm.order.name = '';
                vm.order.contact = '';
                vm.order.country_id = '';
                vm.order.bankName = '';
                vm.order.branchName = '';
                vm.order.bankAcNo = '';
            })
        }
    }
});

myApp.controller('agentListCtrl', function(UtilityService, NgTableParams, WebService, $state) {
    var vm = this;
    if (!countries) {
        countryRequest = UtilityService.getCountries();
        countryRequest.then(function(data) {
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
            agentList = data;
            vm.data = agentList;
            vm.tableParams = new NgTableParams({ count: vm.data.length }, { counts: [], data: vm.data });
        });
    }

    loadAgents();
    vm.delete = function(agentId) {
        var requestObject = {
            method: 'DELETE',
            url: '/api/v1/agents/' + agentId
        }
        var request = WebService.callWebService(requestObject);
        request.then(function(data) {
            loadAgents();
        });
    }

    vm.edit = function(agentId) {
        $state.go('addAgent', { 'agentId': agentId });
    }

    vm.addNewAgent = function(agentId) {
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
    vm.delete = function(receiving_agent_id) {
        var requestObject = {
            method: 'DELETE',
            url: '/api/v1/receiving_agents/' + receiving_agent_id
        }
        var request = WebService.callWebService(requestObject);
        request.then(function(data) {
            loadReceivingAgents();
        });
    }

    vm.edit = function(receiving_agent_id) {
        $state.go('addReceivingAgent', { 'receiving_agent_id': receiving_agent_id });
    }

    vm.addReceivingAgent = function(receiving_agent_id) {
        $state.go('addReceivingAgent');
    }
});

myApp.controller('orderListCtrl', function(UtilityService, NgTableParams, WebService, $state) {
    var vm = this;

    var loadOrders = function() {
        var orders = UtilityService.getOrderList();
        orders.then(function(data) {
            ordersList = data;
            vm.data = ordersList;
            vm.tableParams = new NgTableParams({ count: vm.data.length }, { counts: [], data: vm.data });
        });
    }

    loadOrders();
    vm.delete = function(orderId) {
        var requestObject = {
            method: 'DELETE',
            url: '/api/v1/orders/' + orderId
        }
        var request = WebService.callWebService(requestObject);
        request.then(function(data) {
            loadOrders();
        });
    }

    vm.edit = function(orderId) {
        $state.go('addOrder', { 'orderId': orderId });
    };

    vm.addNewAgent = function(orderId) {
        $state.go('addOrder');
    }
});

myApp.controller('AddAgentPaymentCtrl', function(WebService, UtilityService, $state) {
    var vm = this;
    vm.aPayment = {
        agent_id: '',
        drAmount: 0,
        "main_agent_id": "1"
    };

    if (agentList) {
        vm.agents = agentList;
    } else {
        var agents = UtilityService.getAgentList();
        agents.then(function(data) {
            vm.agents = data;
        });
    }

    vm.title = "Add Agent Payment"
    vm.addAgentPayment = function() {
        var addAgentPaymentRequestObject = {
            method: 'POST',
            url: '/api/v1/agentaccount',
            headers: {
                'Content-Type': 'application/json'
            },
            data: { requestdata: vm.aPayment }
        }
        var addAgentPaymentRequest = WebService.callWebService(addAgentPaymentRequestObject);

        addAgentPaymentRequest.then(function(data) {

        })
    }

});

myApp.controller('MainAccountsCtrl', function(UtilityService, NgTableParams, $state) {
    var vm = this;
    vm.test = 'test';
    var mainAccounts = UtilityService.getMainAccounts();
    vm.tableParams  = new NgTableParams({}, { counts: [], getData: function(){
        return mainAccounts.then(function(data){
            mainAccounts = data.data;
            vm.data = mainAccounts;
            return vm.data;
        });
    }});
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
    vm.filter = {
        from:{},
        to:{}
    };
    datepickerConf(vm.filter.from);
    datepickerConf(vm.filter.to);
});


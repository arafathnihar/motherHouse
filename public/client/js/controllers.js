var myApp = angular.module('motherHouseControllers', []);

var agentList;
var receivingAgentList;
var ordersList;
var countries;
var currencies;

myApp.controller('AddAgentCtrl', function (ApiService, $state, UtilityService,ngToast) {
    var vm = this;
    vm.agent = {
        customId: "",
        name: "",
        contact: "",
        country_id: ""
    };
    if (!countries) {
        var countryRequest = ApiService.getCountries();
        countryRequest.then(function (data) {
            countries = data;
            vm.countries = countries;
        });
    } else {
        vm.countries = countries;
    }
    if ($state.params.agentId) {
        vm.title = "Edit Agent";
        var agentRequest = ApiService.getAgentById($state.params.agentId);
        agentRequest.then(function (data) {
            var agent = data;
            vm.agent.id = agent.id;
            vm.agent.customId = agent.customId;
            vm.agent.name = agent.name;
            vm.agent.contact = agent.contact;
            vm.agent.country_id = agent.country_id;
        });
        vm.addAgent = function () {
            ApiService.updateAgent(vm.agent.id, vm.agent);
        };
    } else {
        vm.title = "Add New Agent";
        vm.addAgent = function () {
            var addAgentRequest = ApiService.addAgent(vm.agent);
            addAgentRequest.then(function (data) {
                if (data)
                    vm.agent = UtilityService.clearForm(vm.agent);
            });
        }
    }

});

myApp.controller('AddReceivingAgentCtrl', function (ApiService, $state, UtilityService,ngToast) {
    var vm = this;
    if (!countries) {
        var countryRequest = ApiService.getCountries();
        countryRequest.then(function (data) {
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
        vm.title = "Edit Receiving Agent";
        var request = ApiService.getReceivingAgentById($state.params.receiving_agent_id);
        request.then(function (data) {
            var receivingagent = data;
            vm.receivingagent.id = receivingagent.id;
            vm.receivingagent.customId = receivingagent.customId;
            vm.receivingagent.name = receivingagent.name;
            vm.receivingagent.contact = receivingagent.contact;
            vm.receivingagent.country_id = receivingagent.country_id;
        });
        vm.addReceivingAgent = function () {
            var request = ApiService.updateReceivingAgent(vm.receivingagent.id, vm.receivingagent);
            request.then(function () {
                ngToast.dismiss();
                $state.go('receivingAgentList');
            });
        }
    } else {
        vm.title = "Add New Receiving Agent";
        vm.addReceivingAgent = function () {
            var request = ApiService.addReceivingAgent(vm.receivingagent);

            request.then(function () {
                vm.receivingagent = UtilityService.clearForm(vm.receivingagent);
            })
        }
    }
});

myApp.controller('AddOrderCtrl', function (ApiService, $state, UtilityService,ngToast) {
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
    vm.order = UtilityService.datepickerConf(vm.order);
    vm.order.orderDate = new Date();

    if (agentList) {
        vm.agents = agentList;
    } else {
        var agents = ApiService.getAgentList();
        agents.then(function (data) {
            vm.agents = data;
        });
    }
    if (receivingAgentList) {
        vm.receivingAgents = receivingAgentList;
    } else {
        var receivingAgents = ApiService.getReceivingAgentList();
        receivingAgents.then(function (data) {
            vm.receivingAgents = data;
        });
    }
    if (!currencies) {
        var countryRequest = ApiService.getCurrencies();
        countryRequest.then(function (data) {
            currencies = data;
            vm.currencies = currencies;
        });
    } else {
        vm.currencies = currencies;
    }
    if (!countries) {
        countryRequest = ApiService.getCountries();
        countryRequest.then(function (data) {
            countries = data;
            vm.countries = countries;
        });

    } else {
        vm.countries = countries;
    }

    if ($state.params.orderId) {
        vm.title = "Edit order";
        var request = ApiService.getOrderById($state.params.orderId);
        request.then(function (data) {
            vm.order.id = data.id;
            vm.order.customId = data.customId;
            vm.order.agent_id = data.agent_id;
            vm.order.receiving_agent_id = data.receiving_agent_id;
            vm.order.orderAmount = data.orderAmount;
            vm.order.order_curr_id = data.order_curr_id;
            vm.order.supply_curr_id = data.supply_curr_id;
            vm.order.exchangeRate = data.exchangeRate;
            vm.order.name = data.receiver.name;
            vm.order.contact = data.receiver.contact;
            vm.order.country_id = data.receiver.country_id;
            vm.order.bankName = data.receiver.bankName;
            vm.order.branchName = data.receiver.branchName;
            vm.order.bankAcNo = data.receiver.bankAcNo;
        });
        vm.addOrder = function () {
            var request = ApiService.updateOrder(vm.order.id, vm.order);
            request.then(function () {
                ngToast.dismiss();
                $state.go('orderList');
            });
        }
    } else {
        vm.title = "Add New Order";
        vm.addOrder = function () {
            var addOrderRequest = ApiService.addOrder(vm.order);

            addOrderRequest.then(function (data) {
                if(data)
                    vm.order = UtilityService.clearForm(vm.order);
            })
        }
    }
});

myApp.controller('agentListCtrl', function (ApiService, NgTableParams, $state,ngToast) {
    var vm = this;
    if (!countries) {
        var countryRequest = ApiService.getCountries();
        countryRequest.then(function (data) {
            countries = data;
            vm.countries = countries;
        });
    } else {
        vm.countries = countries;
    }
    var loadAgents = function () {

        var agents = ApiService.getAgentList();
        agents.then(function (data) {
            agentList = data;
            vm.data = agentList;
            vm.tableParams = new NgTableParams({count: vm.data.length}, {counts: [], data: vm.data});
            agentList = data;
            vm.data = agentList;
            vm.tableParams = new NgTableParams({count: vm.data.length}, {counts: [], data: vm.data});
        });
    };

    loadAgents();
    vm.delete = function (agentId) {
        var request = ApiService.deleteAgent(agentId);
        request.then(function () {
            loadAgents();
        });
    };

    vm.edit = function (agentId) {
        ngToast.dismiss();
        $state.go('addAgent', {'agentId': agentId});
    };

    vm.addNewAgent = function () {
        ngToast.dismiss();
        $state.go('addAgent');
    };
});

myApp.controller('receivingAgentListCtrl', function (ApiService, NgTableParams, $state,ngToast) {
    var vm = this;
    var loadReceivingAgents = function () {
        var receivingAgents = ApiService.getReceivingAgentList();
        receivingAgents.then(function (data) {
            receivingAgentList = data;
            vm.data = receivingAgentList;
            vm.tableParams = new NgTableParams({count: vm.data.length}, {counts: [], data: vm.data});
        });
    };

    loadReceivingAgents();
    vm.delete = function (receiving_agent_id) {
        var request = ApiService.deleteReceivingAgent(receiving_agent_id);
        request.then(function () {
            loadReceivingAgents();
        });
    };

    vm.edit = function (receiving_agent_id) {
        ngToast.dismiss();
        $state.go('addReceivingAgent', {'receiving_agent_id': receiving_agent_id});
    };

    vm.addReceivingAgent = function () {
        ngToast.dismiss();
        $state.go('addReceivingAgent');
    }
});

myApp.controller('orderListCtrl', function (ApiService, NgTableParams, $state,ngToast) {
    var vm = this;

    var loadOrders = function () {
        var orders = ApiService.getOrderList();
        orders.then(function (data) {
            ordersList = data;
            vm.data = ordersList;
            vm.tableParams = new NgTableParams({count: vm.data.length}, {counts: [], data: vm.data});
        });
    };

    loadOrders();
    vm.delete = function (orderId) {
        var request = ApiService.deleteOrder(orderId);
        request.then(function () {
            loadOrders();
        });
    };

    vm.edit = function (orderId) {
        ngToast.dismiss();
        $state.go('addOrder', {'orderId': orderId});
    };

    vm.addNewAgent = function () {
        ngToast.dismiss();
        $state.go('addOrder');
    }
});

myApp.controller('AddAgentPaymentCtrl', function (ApiService, $state, UtilityService,ngToast) {
    var vm = this;
    vm.aPayment = {
        agent_id: '',
        amount: 0,
        date: '',
        collector_name: '',
        "main_agent_id": "1"
    };

    vm.aPayment = {};
    vm.aPayment = UtilityService.datepickerConf(vm.aPayment);
    vm.aPayment.today();
    vm.aPayment.date = new Date();

    if (agentList) {
        vm.agents = agentList;
    } else {
        var agents = ApiService.getAgentList();
        agents.then(function (data) {
            vm.agents = data;
        });
    }

    if ($state.params.paymentId) {
        vm.title = "Edit Payments";
        var request = ApiService.getAgentPaymentById($state.params.paymentId);
        request.then(function (data) {
            vm.aPayment.id = data.id;
            vm.aPayment.agent_id = data.agent_id;
            vm.aPayment.amount = data.drAmount;
            vm.aPayment.collector_name = data.collector;
        });
        vm.addAgentPayment = function () {
            var request = ApiService.updateAgentPayment(vm.aPayment.id, vm.aPayment);
            request.then(function () {
                ngToast.dismiss();
                $state.go('agentPaymentList');
            });
        }
    } else {
        vm.title = "Add Agent Payment";
        vm.addAgentPayment = function () {
            var request = ApiService.addAgentPayment(vm.aPayment);

            request.then(function () {
                vm.aPayment = UtilityService.clearForm(vm.aPayment);
            })
        }
    }

});

myApp.controller('AgentPaymentListCtrl', function (ApiService, NgTableParams, $state,ngToast) {
    var vm = this;
    vm.payment = {
        agent_id:"",
        paymentList:""
    }
    if (agentList) {
        vm.agents = agentList;
    } else {
        var agents = ApiService.getAgentList();
        agents.then(function (data) {
            vm.agents = data;
        });
    }

    vm.edit = function (paymentId) {
        ngToast.dismiss();
        $state.go('addAgentPayment', {'paymentId': paymentId});
    };

    vm.addAgentPayment = function () {
        ngToast.dismiss();
        $state.go('addAgentPayment');
    };

    vm.loadPaymentList = function () {
        var payments = ApiService.getAgentPaymentListByAgentId(vm.payment.agent_id);
        payments.then(function (data) {
            vm.payment.paymentList = data;
            vm.tableParams = new NgTableParams({count: data.length}, {counts: [], data: data});
        });
    };

    vm.delete = function (paymentId) {
        var request = ApiService.deleteAgentPaymenById(paymentId);
        request.then(function () {
            vm.loadPaymentList();
        });
    };
});

myApp.controller('MainAccountsCtrl', function (ApiService, NgTableParams,UtilityService) {
    var vm = this;
    vm.test = 'test';

    vm.filter = {
        from: {},
        to: {}
    };
    vm.updateAccoutsList = function () {
        var mainAccounts = ApiService.getMainAccountsByDate(UtilityService.yyyymmdd(vm.filter.from.date),UtilityService.yyyymmdd(vm.filter.to.date));
        vm.tableParams = new NgTableParams({}, {
            counts: [], getData: function () {
                return mainAccounts.then(function (data) {
                    mainAccounts = data;
                    vm.data = mainAccounts;
                    return vm.data;
                });
            }
        });
    };
    vm.filter.from = UtilityService.datepickerConf(vm.filter.from);
    vm.filter.to = UtilityService.datepickerConf(vm.filter.to);
});

myApp.controller('AgentAccountsCtrl', function(ApiService,UtilityService, NgTableParams) {
    var vm = this;
    vm.filter = {
        agentId:'',
        from:{},
        to:{}
    };
    if (agentList) {
        vm.agents = agentList;
    } else {
        var agents = ApiService.getAgentList();
        agents.then(function(data) {
            vm.agents = data;
        });
    }
    vm.updateAccoutsList = function () {
        var agentAccounts = ApiService.getAgentAccountsByDate(vm.filter.agentId,UtilityService.yyyymmdd(vm.filter.from.date),UtilityService.yyyymmdd(vm.filter.to.date));
        vm.tableParams  = new NgTableParams({}, { counts: [], getData: function(){
            return agentAccounts.then(function(data){
                agentAccounts = data;
                vm.data = agentAccounts;
                return vm.data;
            });
        }});
    };
    vm.filter.from = UtilityService.datepickerConf(vm.filter.from);
    vm.filter.to = UtilityService.datepickerConf(vm.filter.to);
});

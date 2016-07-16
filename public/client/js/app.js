var myApp = angular.module('motherHouse', ['ds.clock','ui.bootstrap','ui.router','ngTable','motherHouseServices','motherHouseControllers', 'ngToast']);

myApp.config(function($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise("/addOrder");
    $stateProvider
        .state('addAgent', {
            url: "/addAgent/:agentId",
            params: { agentId: undefined },
            templateUrl: "/client/templates/addAgent.html"
        })
        .state('agentList', {
            url: "/agentList",
            templateUrl: '/client/templates/agentList.html'
        })
        .state('addOrder', {
            url: "/addOrder/:orderId",
            params: { orderId: undefined },
            templateUrl: "/client/templates/addOrder.html"
        })
        .state('orderList', {
            url: "/orderList",
            templateUrl: '/client/templates/orderList.html'
        })
        .state('addReceivingAgent', {
            url: "/addReceivingAgent/:receiving_agent_id",
            params: { receiving_agent_id: undefined },
            templateUrl: "/client/templates/addReceivingAgent.html"
        })
        .state('receivingAgentList', {
            url: "/receivingAgentList",
            templateUrl: '/client/templates/receivingAgentList.html'
        })
        .state('addAgentPayment', {
            url: "/addAgentPayment/",
            templateUrl: '/client/templates/addAgentPayment.html'
        });
});
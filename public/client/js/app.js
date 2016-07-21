var myApp = angular.module('motherHouse', ['ds.clock', 'ui.bootstrap', 'ui.router', 'ngTable', 'motherHouseServices', 'motherHouseControllers', 'ngToast', 'blockUI']);

myApp.config(function ($stateProvider, $urlRouterProvider, ngToastProvider) {

    $urlRouterProvider.otherwise("/addOrder/");
    $stateProvider
        .state('addAgent', {
            url: "/addAgent/:agentId",
            params: {agentId: undefined},
            templateUrl: "/client/templates/addAgent.html"
        })
        .state('agentList', {
            url: "/agentList",
            templateUrl: '/client/templates/agentList.html'
        })
        .state('addOrder', {
            url: "/addOrder/:orderId",
            params: {orderId: undefined},
            templateUrl: "/client/templates/addOrder.html"
        })
        .state('orderList', {
            url: "/orderList",
            templateUrl: '/client/templates/orderList.html'
        })
        .state('addReceivingAgent', {
            url: "/addReceivingAgent/:receiving_agent_id",
            params: {receiving_agent_id: undefined},
            templateUrl: "/client/templates/addReceivingAgent.html"
        })
        .state('receivingAgentList', {
            url: "/receivingAgentList",
            templateUrl: '/client/templates/receivingAgentList.html'
        })
        .state('mainAccounts', {
            url: "/mainAccounts",
            templateUrl: '/client/templates/mainAccounts.html'
        })
        .state('agentAccounts', {
            url: "/agentAccounts",
            templateUrl: '/client/templates/agentAccounts.html'
        })
        .state('addAgentPayment', {
            url: "/addAgentPayment/:paymentId",
            params: {paymentId: undefined},
            templateUrl: '/client/templates/addAgentPayment.html'
        })
        .state('agentPaymentList', {
            url: "/agentPaymentList",
            templateUrl: '/client/templates/agentPaymentList.html'
        });

    ngToastProvider.configure({
        horizontalPosition: 'center',
        verticalPosition: 'center'
    });
});

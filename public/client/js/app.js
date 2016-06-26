var myApp = angular.module('motherHouse', ['ds.clock','ui.bootstrap','ui.router','ngTable','motherHouseServices','motherHouseControllers']);

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
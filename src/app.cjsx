# @cjsx React.DOM
React = require 'react'
Router = require 'react-router'
Routes = Router.Routes
Route = Router.Route
Link = Router.Link
DefaultRoute = Router.DefaultRoute

Header = require './pages/header'
Contact = require './pages/contact'
Home = require './pages/home'
Config = require './pages/config'


App = React.createClass
  render: ->
    <div className="container">
      <Header>
      </Header>
      <div className="row clearfix">
        <@props.activeRouteHandler />
      </div>
    </div>

routes = (
  <Routes location="hash">
      <Route name="app" path="/" handler={App}>
        <Route name="home" handler={Home} />
        <Route name="config" handler={Config} />
        <Route name="contact" handler={Contact} />
      </Route>
    <DefaultRoute handler={App} />
  </Routes>
)


React.renderComponent(routes, document.body)

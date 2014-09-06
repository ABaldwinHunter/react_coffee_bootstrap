React = require 'react'
Router = require 'react-router'
Routes = Router.Routes
Route = Router.Route
Link = Router.Link
DefaultRoute = Router.DefaultRoute



Config = React.createClass
  render: ->
    <div>
      Config Page
    </div>

Contact = React.createClass
  render: ->
    <div>
      Contact
    </div>


App = React.createClass
  render: ->
    <div className="container">
      <div className="row clearfix">
        <div className="col-md-12 column">
          <nav className="navbar navbar-default" role="navigation">
            <div className="navbar-header">
               HELLO
            </div>
            <div className="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul className="nav navbar-nav">
                <li>
                  <Link to="config">config</Link>
                </li>
                <li>
                  <Link to="contact">contact</Link>
                </li>
                <li className="dropdown">
                   <a href="#" className="dropdown-toggle" data-toggle="dropdown">Dropdown<strong className="caret"></strong></a>
                  <ul className="dropdown-menu">
                    <li>
                      <a href="#">Action</a>
                    </li>
                    <li>
                      <a href="#">Another action</a>
                    </li>
                    <li>
                      <a href="#">Something else here</a>
                    </li>
                    <li className="divider">
                    </li>
                    <li>
                      <a href="#">Separated link</a>
                    </li>
                    <li className="divider">
                    </li>
                    <li>
                      <a href="#">One more separated link</a>
                    </li>
                  </ul>
                </li>
              </ul>
              <form className="navbar-form navbar-left" role="search">
                <div className="form-group">
                  <input type="text" className="form-control" />
                </div> <button type="submit" className="btn btn-default">Submit</button>
              </form>
              <ul className="nav navbar-nav navbar-right">
                <li>
                  <a href="#">Link</a>
                </li>
                <li className="dropdown">
                   <a href="#" className="dropdown-toggle" data-toggle="dropdown">Dropdown<strong className="caret"></strong></a>
                  <ul className="dropdown-menu">
                    <li>
                      <a href="#">Action</a>
                    </li>
                    <li>
                      <a href="#">Another action</a>
                    </li>
                    <li>
                      <a href="#">Something else here</a>
                    </li>
                    <li className="divider">
                    </li>
                    <li>
                      <a href="#">Separated link</a>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
          </nav>
          <div className="row clearfix">
            <@props.activeRouteHandler />
          </div>
        </div>
      </div>
    </div>


Error404 = React.createClass
  render: ->
    <div>
      React 404
    </div>



routes = (
  <Routes location="hash">
      <Route name="app" path="/" handler={App}>
        <Route name="config" handler={Config} />
        <Route name="contact" handler={Contact} />
      </Route>
    <DefaultRoute handler={App} />
  </Routes>
)


React.renderComponent(routes, document.body)

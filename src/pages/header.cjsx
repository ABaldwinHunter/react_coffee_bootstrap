# @cjsx React.DOM
React = require 'react'
Boot = require 'react-bootstrap'
NavItemLink = require '../react-router-bootstrap/NavItemLink'
Navbar = Boot.Navbar
Nav = Boot.Nav

Header = React.createClass
  render: ->
    <div className="row clearfix">
      <Navbar>
        <Nav>
          <NavItemLink key={2} to="home">Home</NavItemLink>
          <NavItemLink key={1} to="contact">Contact</NavItemLink>
        </Nav>
        <Nav pullRight>
          <NavItemLink key={2} to="config">config</NavItemLink>
        </Nav>
      </Navbar>
    </div>


module.exports = Header

// ***********************************************
// This example commands.js shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
//
//
// -- This is a parent command --
// Cypress.Commands.add("login", (email, password) => { ... })
//
//
// -- This is a child command --
// Cypress.Commands.add("drag", { prevSubject: 'element'}, (subject, options) => { ... })
//
//
// -- This is a dual command --
// Cypress.Commands.add("dismiss", { prevSubject: 'optional'}, (subject, options) => { ... })
//
//
// -- This will overwrite an existing command --
// Cypress.Commands.overwrite("visit", (originalFn, url, options) => { ... })



// Yeah I know you're not supposed to do it this way. But, how are you supposed
// to do it? Until I know that, there's this.
Cypress.Commands.add('login', () => {
  cy.visit('/')
  cy.get('#nav-sign-in').click()
  cy.get('#user_login').type('honestabe')
  cy.get('#user_password').type('Password1')
  cy.get('input[type=submit]').click()
})

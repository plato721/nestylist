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

// This logs in without rendering the login form. Use method in login.spec
// for interactive login.
Cypress.Commands.add('login', () => {
    cy.request({
    url:'/users/sign_in',
    method:'get'
  })
  .its('body')
  .then((body) => {
    const $form = Cypress.$(body).find('form')
    const authToken = $form.find('[name="authenticity_token"]').attr('value')
    cy.request({
      url:'/users/sign_in',
      method:'post',
      form:true,
      body:{
        utf8:'✓',
        authenticity_token:authToken,
        user:{
          login:'honestabe',
          password:'Password1',
        }
      }
    })
  })
})

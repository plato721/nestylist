describe ('Login', function() {
  it('is able to log in using test user', function() {
    cy.visit('/')
    cy.get('#nav-sign-in').click()
    cy.get('#user_login').type('honestabe')
    cy.get('#user_password').type('Password1')
    cy.get('input[type=submit]').click()
    cy.contains('body', 'successful')
  })
})

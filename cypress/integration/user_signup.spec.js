describe('User signup', () => {
  it('signs up', () => {
    // if the user is already there, this will fail validation
    cy.request(
      'delete',
      '/test/users/destroy_username', {
        'username':'leeroy_jenkins'
    })

    cy.visit('/')
    cy.get('#nav-sign-up').click()
    cy.get('#user_username').type('leeroy_jenkins')
    cy.get('#user_password').type('Password1!')
    cy.get('#user_password_confirmation').type('Password1!')
    cy.get("[type=submit]").click()

    cy.url()
      .should('eq', 'http://localhost:3000/')

    cy.get('body')
      .should('contain', 'successful')
      .should('contain', 'Logged in')

    // cleanup
    cy.request(
      'delete',
      '/test/users/destroy_username', {
        'username':'leeroy_jenkins'
    })
  })
})

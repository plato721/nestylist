describe('User signup', () => {
  const username = 'leeroy_jenkins'
  const password = 'Password1!'

  before(() => {
    cy.request(
      'delete',
      '/test/users/destroy_username', {
        'username': username
    })
  })

  afterEach(() => {
    cy.request(
      'delete',
      '/test/users/destroy_username', {
        'username':username
    })
  })

  it('signs up', () => {
    cy.visit('/')
    cy.get('#nav-sign-up').click()
    cy.get('#user_username').type(username)
    cy.get('#user_password').type(password)
    cy.get('#user_password_confirmation').type(password)
    cy.get("[type=submit]").click()

    cy.url()
      .should('eq', 'http://localhost:3000/')

    cy.get('body')
      .should('contain', 'successful')
      .should('contain', 'Logged in')
      .should('contain', 'leeroy_jenkins')
  })

  // Well apparently we can't tab in cypress. But this will be a little
  // different than the first test. TODO - update when you can.
  it('signs up with keyboard only', () => {
    cy.visit('/')
    cy.get('#nav-sign-up').click()
    cy.focused().should('have.id', 'user_username')
    cy.get('#user_username').focus().type(username)

    cy.get('#user_password').focus().type(password)
    cy.get('#user_password_confirmation').focus().type(password)
    cy.get("[type=submit]").focus().type(`{enter}`)

    cy.url()
      .should('eq', 'http://localhost:3000/')

    cy.get('body')
      .should('contain', 'successful')
      .should('contain', 'Logged in')
      .should('contain', 'leeroy_jenkins')
  })
})

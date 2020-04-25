describe('Logout', () => {
  it('can sign out once signed in', () => {
    cy.login()

    // were we ever logged in? check
    cy.get('body')
      .should('contain', 'honestabe')

    cy.get('#nav-sign-out').click()

    cy.url()
      .should('eq', 'http://localhost:3000/')

    cy.get('body')
      .should('contain', 'Signed out')
      .should('not.match', 'honestabe')
  })
})

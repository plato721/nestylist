describe('Add item to list', ()=>{
  it('adds an item', ()=>{
    cy.login()

    cy.visit('/')
    cy.get('[data-cy=inventory]').click()
    cy.get('[data-cy=add-item]').click()
    cy.focused()
      .should('have.id', 'item_name')
      .type(`Sweet molasses{enter}`)

  // TODO - prompt first for stores where to buy items
  //     with checkbox select
  //     defaulting to "any" store
    cy.get('body')
      .should('contain', 'Sweet molasses')
  })
})

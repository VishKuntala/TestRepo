

/// <reference types="cypress" />

context('Filter Component', () => {
    beforeEach(() => {
        cy.visit('127.0.0.1:8080/MidMarket/MidMarket.aspx')
    })

    describe('Search Box', () => {
        it('SV Search should trigger results when a minimum of 3 characters are typed', () => {
            cy.get('.prompt')
                .type('KOB').should('have.value', 'KOB');
            cy.screenshot();
        })
    })

})

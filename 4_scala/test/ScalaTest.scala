class ScalaTest {
/*
 Scala Test is an interesting example of the sort of literate API that is possible even in a statically-typed language once closures are available.

The core Spec can be used in different styles of testing (http://www.scalatest.org/quick_start) using traits (mixins); this is the canonical Stack example, note the use of the 'pending' method to act as placeholder - this is how our acceptance tests might start life

class ExampleSpec extends FeatureSpec with GivenWhenThen {
 
  feature("The user can pop an element off the top of the stack") {
 
    info("As a programmer")
    info("I want to be able to pop items off the stack")
    info("So that I can get them in last-in-first-out order")
 
    scenario("pop is invoked on a non-empty stack") {
      given("a non-empty stack")
      when("when pop is invoked on the stack")
      then("the most recently pushed element should be returned")
      and("the stack should have one less item than before")
      pending
    }
 
    scenario("pop is invoked on an empty stack") {
      given("an empty stack")
      when("when pop is invoked on the stack")
      then("NoSuchElementException should be thrown")
      and("the stack should still be empty")
      pending
    }
  }
}

And this is something more domain-specific, with full integration with Java classes of course class ProductXSpec extends FeatureSpec with GivenWhenThen {

  feature("Pricing Summary screen") {
    info("As a Sales User")
    info("I want to see pricing information for Product X")
    info("So that I know what I will pay before I order it")
    info("STORY-ID: XYZ-1234")

    scenario("""Product X has been configured and added to quote,
      it should display relevant pricing summary for Product X in Quote Summary Page""") {

        given("Product X has been configured and added to Quote")
        new CustomerFixture(browser).searchCustomer7789()
        var projects = new CustomerProjectsFixture(browser)
        projects.createProjectGlobalInc()
        projects.selectProjectGlobalInc()
        // Add products X Global Inc.
        var project = new ProjectFixture(browser)
        project.addProductX()
        // Configure product X
        project.selectProductXForConfiguration()
        new ProductXConfigurationFixture(browser).configure()
        project.browseToProjectGlobalInc()

        when("Pricing Summary is produced")
        var projectItems = new QuoteProductFixture(browser)
        projectItems.selectProductsForQuote(RSQE_PRODUCT_X, RSQE_PRODUCT_Q)

        then("""I should see the pricing information for Product X
                on the pricing sheet and show a status of 'QUOTED'""")
        pending
    }
  }
}

The output when run is
ProductXSpec:
Pricing Summary screen
  As a Sales User
  I want to see pricing information for Product X
  So that I know what I will pay before I order it
  STORY-ID: XYZ-1234
  Scenario: Product X has been configured and added to quote,
      it should display relevant pricing summary for Product X in Quote Summary Page (pending)
    Given Product X has been configured and added to Quote 
    When Pricing Summary is produced 
    Then I should see the pricing information for Product X
                on the pricing sheet and show a status of 'QUOTED' 
Run completed in 46 milliseconds.
Total number of tests run: 0
Suites: completed 1, aborted 0
Tests: succeeded 0, failed 0, ignored 0, pending 1


There's a github repo here https://github.com/tonybaines/scalatest-demo with
  * A gradle build file (of course ;)
  * An IDEA project (this needs the Scala plugin and an SDK to run)

The JUnitRunner makes integration with the usual tools nice and easy

~Tony
________________________________________
From: Bauer,G,Gary,DKJ C
Sent: 28 October 2011 09:59
To: Krishnegowda,D,Deepak,DKJ C; Kong,D,Daniel,DKJ C; Roberts,J,James,DKJ R; Aggarwal,V,Vishal,DKJ C; Baines,AP,Tony,DKJ R; Ballinger,D,Darren,DKJ C; Elif Pratt (epratt@thoughtworks.com); Endacott,S,Steve,DKA C; Francis,S,Shaun,DKJ C; Horsley,M,Marcus,DKJ R; Ireneo Garcia Suarez,R,Raul C; Jeremy Suarez (jsuarez@thoughtworks.com); Knauf,A,Aaron,DKJ R; Krishnaswamy,S,Sriram,DKJ C; Kumara,K,Kasun,DKJ C; Ludwig,GJA,Graeme,DKJ R; Naidu,P,Purushothama,DKR C; O'Donnell,H,Hugh,DKJ C; Singh,SK,Saurabh,DKJ C; Singhal,S,Sumit,DKJ C; Spencer,T,Tim,DKJ C; Upadhyay,S,Saurabh,DKJ C; Wall,OJF,Olivier,DK23 R; Watson,S,Simon,DKJ C; Wharton,A,Arron,DKQ6 C
Subject: JBehave

JBehave uses annotations to match methods to stories  as described in this graphic:  http://jbehave.org/reference/stable/

Basically the stories are easy to read plain text, free of any code or markup, the corresponding Java class uses @Given, @When and @Then annotations to match methods to the text.

Benefit of story/code separation is easier to read stories for BA & User and easier to read code for developers.

The same method can be used in multiple stories and/or scenarios and can be parameterised for flexibility eg.

CreditLimitRequests.story

Story:  As a salesperson I want to request that a customer’s credit limit be raised So that: blah…

Scenario: User is creditworthy
Given a retail customer with a credit rating of AA When I request a credit limit of 500 GBP Then the request is approved

Scenario: User not creditworthy
Given a corporate customer with a credit rating of Z When I request a credit limit of 100000 GBP Then the request is rejected


public class CreditLimiRequests{
@Given(“Given a $customerType customer with a credit rating of $creditRating”) public void givenCustomerStatus(String customerType, String creditRating){ }

@When(“When I request a credit limit of $limitRequested GBP”) public void whenCreditRequested(double limitRequested){ }

@Then(“Then the request is $decision”)
public void thenCreditDecsion (String decision){ } }





_____________________________________________
From: Krishnegowda,D,Deepak,DKJ C
Sent: 27 October 2011 10:00
To: Kong,D,Daniel,DKJ C; Roberts,J,James,DKJ R; Aggarwal,V,Vishal,DKJ C; Baines,AP,Tony,DKJ R; Ballinger,D,Darren,DKJ C; Bauer,G,Gary,DKJ C; Elif Pratt (epratt@thoughtworks.com); Endacott,S,Steve,DKA C; Francis,S,Shaun,DKJ C; Horsley,M,Marcus,DKJ R; Ireneo Garcia Suarez,R,Raul C; Jeremy Suarez (jsuarez@thoughtworks.com); Knauf,A,Aaron,DKJ R; Krishnaswamy,S,Sriram,DKJ C; Kumara,K,Kasun,DKJ C; Ludwig,GJA,Graeme,DKJ R; Naidu,P,Purushothama,DKR C; O'Donnell,H,Hugh,DKJ C; Singh,SK,Saurabh,DKJ C; Singhal,S,Sumit,DKJ C; Spencer,T,Tim,DKJ C; Upadhyay,S,Saurabh,DKJ C; Wall,OJF,Olivier,DK23 R; Watson,S,Simon,DKJ C; Wharton,A,Arron,DKQ6 C
Subject: EasyB BDD library


Hi ,

Easyb is a BDD library which helps to drive the development by specifying the test cases in more English friendly manner . It has two DSL’s :- 1) User story 2) Specification.

A typical user story looks like below :-


scenario  "Product X has been configured and added to quote ,
           it should display relevant pricing summary for Product X in Quote Summary Page" , {

        given "Product X has been configured and added to Quote" , {
        }

        when "Pricing Summary is produced" , {
        }

        then " Then I should see the pricing information for Product X
               on the pricing sheet and show a status of 'QUOTED'" , {
        }

}

Business Analysts can write these user stories and when we run these user stories , it will be in pending state since code has to be plugged in to the above given,when,then scenarios.

Developer can then start filling in the test code for all pending user stories like below :-


scenario  "Product X has been configured and added to quote ,
           it should display relevant pricing summary for Product X in Quote Summary Page" , {

        given "Product X has been configured and added to Quote" , {

        new CustomerFixture(browser).searchCustomer7789();
                  CustomerProjectsFixture projects = new CustomerProjectsFixture(browser);
                   projects.createProjectGlobalInc();
                           projects.selectProjectGlobalInc();
           // Add products X Global Inc.
                   ProjectFixture project = new ProjectFixture(browser);
                  project.addProductX();
                         // Configure product X
                  project.selectProductXForConfiguration();
                   new ProductXConfigurationFixture(browser).configure();
                  project.browseToProjectGlobalInc();
 }

        when "Pricing Summary is produced" , {
        QuoteProductFixture projectItems = new QuoteProductFixture(browser);
               projectItems.selectProductsForQuote(RSQE_PRODUCT_X, RSQE_PRODUCT_Q);
        }

        then " Then I should see the pricing information for Product X
               on the pricing sheet and show a status of 'QUOTED'" , {
                // Assertions to be made
        }

}


It has to IDE integrations with Intellij,Eclipse and can be run from ant,gradle and maven .

For more info :-

http://www.easyb.org/

Regards
Deepak



 */
}
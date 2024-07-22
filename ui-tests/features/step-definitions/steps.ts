import { Given, When, Then } from '@wdio/cucumber-framework';
import { expect, $ } from '@wdio/globals'

import LoginPage from '../pageobjects/login.page.js';
import SecurePage from '../pageobjects/secure.page.js';
import MainPage from "../pageobjects/main.page.js";
import SearchResultsPage from "../pageobjects/search-results.page.js";

const pages = {
    login: LoginPage,
    main: MainPage
}

Given(/^I am on the (\w+) page$/, async (page) => {
    await pages[page].open()
});

When(/^I search for (.+)$/, async (term) => {
    await MainPage.search(term)
})

When(/^I login with (\w+) and (.+)$/, async (username, password) => {
    await LoginPage.login(username, password)
});

Then(/^I should see a flash message saying (.*)$/, async (message) => {
    await expect(SecurePage.flashAlert).toBeExisting();
    await expect(SecurePage.flashAlert).toHaveTextContaining(message);
});

Then(/^I should see a list of videos matching the search term$/, async () => {
    await expect(SearchResultsPage.videoList).toBeExisting();
})
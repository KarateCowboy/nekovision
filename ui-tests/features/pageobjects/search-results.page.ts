import { $ } from '@wdio/globals'
import Page from './page.js';

class SearchResultsPage extends Page {
    /**
     * define selectors using getter methods
     */

    public get inputSearch () {
        return $('#search');
    }

    public get videoList () {
        return $('ul.video-list');
    }

    public get searchSubmit () {
        return $('button[type="submit"]');
    }

    /**
     * a method to encapsule automation code to interact with the page
     * e.g. to login using username and password
     */
    public async search (term: string) {
        await this.inputSearch.setValue(term);
        await this.searchSubmit.click();
    }


    /**
     * overwrite specific options to adapt it to page object
     */
    public async open () {
        await super.open('');
    }
}

export default new SearchResultsPage();

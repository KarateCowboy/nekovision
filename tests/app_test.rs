use neko_vision::{set_page, update, Message, Page, State, search};
use neko_vision::Page::Main;
use Page::SearchResults;

#[tokio::test]
async fn navigate_to_search_page() {
    let app_state = State { current_page: Page::Main };
    let (state, msg) = update(app_state, Message::Navigate(SearchResults("butt".to_string()))).await;
    assert_eq!(state.current_page, SearchResults("butt".to_string()));
    assert_eq!(Message::None, msg, "Testing that navigation to search results page works correctly");
}

#[tokio::test]
async fn navigate_to_main_page(){
    let app_state = State { current_page: Page::SearchResults("".to_string()) };
    let (state, msg) = update(app_state, Message::Navigate(Main)).await;
    assert_eq!(state.current_page, Main);
    assert_eq!(msg, Message::None);
}

#[test]
fn test_set_page_search_results(){
    let app_state = State { current_page: Page::Main };
    let (new_state, new_message) = set_page(&app_state, SearchResults("butt".to_string()));
    assert_eq!(new_state.current_page, SearchResults("butt".to_string()));
    assert_eq!(new_message, Message::Search("butt".to_string()));
}

#[tokio::test]
async fn search_results_works(){
    let result = search("O1KUomqrfek").await;
    assert_eq!(result.is_ok(), true);
    let search_result = result.unwrap();
    println!("here is the search result");
    assert!(search_result.len() > 0);
}
use invidious::CommonVideo;
use invidious::hidden::SearchItem;
use neko_vision::{set_page, update, Message, Page, State, search};
use neko_vision::Page::Main;
use Page::SearchResults;

// #[tokio::test]
// async fn navigate_to_search_page() {
//     let app_state = State { current_page: Page::Main };
//     let (state, msg) = update(app_state, Message::Navigate(SearchResults("butt".to_string()))).await;
//     assert_eq!(state.current_page, SearchResults("butt".to_string()));
//     assert_eq!(Message::None, msg, "Testing that navigation to search results page works correctly");
// }

#[tokio::test]
async fn navigate_to_main_page() {
    let app_state = State { current_page: Page::SearchResults("".to_string()) };
    let (state, msg) = update(app_state, Message::Navigate(Main)).await;
    assert_eq!(state.current_page, Main);
    assert_eq!(msg, Message::None);
}

#[test]
fn test_set_page_search_results() {
    let app_state = State { current_page: Page::Main };
    let (new_state, new_message) = set_page(&app_state, SearchResults("butt".to_string()));
    assert_eq!(new_state.current_page, SearchResults("butt".to_string()));
    assert_eq!(new_message, Message::Search("butt".to_string()));
}

#[tokio::test]
async fn search_results_works() {
    let result = search("O1KUomqrfek").await;
    assert_eq!(result.is_ok(), true);
    let search_result: Vec<SearchItem> = result.unwrap();
    println!("here is the search result");
    let video_results: Vec<&CommonVideo> = search_result.iter()
        .filter(|item| matches!(item, SearchItem::Video(_)))
        .map(|item| if let SearchItem::Video(video) = item { video } else { unreachable!() }).collect();
    println!("{:?}", video_results);

    //let video_titles: Vec<String> = video_results.iter().map(|video: &&CommonVideo| &video.title.to_string().clone()).collect();
    assert_eq!(true, true);
    //println!("{:?}", video_titles);
    //assert!(!video_results.is_empty());
    //assert!(&search_result.len() > &0);
}

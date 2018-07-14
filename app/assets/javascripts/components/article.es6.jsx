class Article extends React.Component {
  constructor(props) {
    super(props)
  }

  render () {
    return (
      <div>
        {this.props.articles.map(function(article){
          return(
            <div className='article'>
              <h2><a href={`/article/${article.id}`}>{article.title}</a></h2>
              <p>{formatTime(article.created_at)}</p>
            </div>
          )}
         )
        }
      </div>
    )
  }
}

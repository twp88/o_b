class Article extends React.Component {
  constructor(props) {
    super(props)
  }

  render () {
    return (
      <div className='article'>
        {this.props.articles.map(function(article){
          return(
            <h2><a href={`/article/${article.id}`}>{article.title}</a></h2>
          )}
         )
        }
      </div>
    )
  }
}

import React from 'react';
import ReactWordcloud from 'react-wordcloud';

function getWords() {
  const [result, setResult] = React.useState([]);
  const [loading, setLoading] = React.useState('false');

  React.useEffect(() => {
    async function fetchWords() {
      try {
        const csrf = document.querySelector("meta[name='csrf-token']").getAttribute('content');
        const response = await fetch('/words/', {
          method: 'get',
          headers: {
            'Content-Type': 'application/json',
            Accept: 'application/json',
            'X-CSRF-Token': csrf,
          },
        });
        const json = await response.json();
        setResult(json);
        setLoading('true');
      } catch (error) {
        setLoading('null');
      }
    }
    fetchWords();
  }, []);

  return [result, loading];
}

function WordCloud() {
  const [result, loading] = getWords();
  let renderedComponent;

  if (loading === 'false') {
    renderedComponent = <p>Loading...</p>;
  } else if (loading === 'null') {
    renderedComponent = <p>Something went terribly wrong.</p>;
  } else {
    const options = {
      colors: ['#000000'],
      fontFamily: 'Silom',
      rotations: [0],
      enableTooltip: false,
      fontSizes: [12, 60],
      scale: 'sqrt',
    };
    renderedComponent = (
      <div>
        <p>
          Help us sell our user&apos;s data!
          <br />
          Tell the biggest word to Donor Registration and be rewarded for your efforts!
        </p>
        <ReactWordcloud words={result} options={options} />
      </div>
    );
  }

  return <div>{renderedComponent}</div>;
}

WordCloud.propTypes = {};
export default WordCloud;

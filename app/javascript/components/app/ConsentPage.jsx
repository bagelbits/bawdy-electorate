import React from 'react';
import Button from 'react-bootstrap/Button';
import PropTypes from 'prop-types';

const ConsentPage = ({ setConsent }) => {
  return (
    <div>
      <p className="consent-page">
        Bawdy Electorate contains erotic text and due to its content it should not be viewed by
        anyone.
      </p>
      <div className="consent-buttons">
        <Button
          id="consent"
          onClick={() => {
            setConsent(true);
          }}
        >
          I consent to this!
        </Button>
        <Button
          id="leave"
          onClick={() => {
            window.location.href = 'about:blank';
          }}
        >
          Get me out of here!
        </Button>
      </div>

      <div className="credits">
        <h1 className="credit-title">Credits</h1>
        <p className="credit">Designed by Caitlyn Kilgore and Chris Ward</p>
        <p className="credit">Created by Chris Ward</p>
        <p className="credit">
          &quot;Bell, Counter, A.wav&quot; by InspectorJ (www.jshaw.co.uk) of Freesound.org
        </p>
      </div>
    </div>
  );
};

ConsentPage.propTypes = {
  setConsent: PropTypes.func.isRequired,
};

export default ConsentPage;

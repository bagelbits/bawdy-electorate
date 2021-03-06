import React from 'react';
import Button from 'react-bootstrap/Button';
import PropTypes from 'prop-types';

const ConsentPage = ({ setConsent }) => {
  const eyeLink = document.querySelector("meta[name='eye']").getAttribute('content');
  return (
    <div>
      <p className="consent-page">
        You&apos;re about to embark on a (potentially) sexy journey. By continuing, you understand
        that you will see written content of a graphic sexual nature. The content is written by
        users, and we cannot take responsibility for it. By continuing, you also agree not to engage
        in hate speech of any kind. No racist, misogynistic, homophobic, transphobic, ageist,
        ableist, etc language. Don&apos;t yuck someone&apos;s yum. If you see something that goes
        against these guidelines, report it.
        <br />
        <br />
        Continue?
      </p>
      <div className="consent-buttons">
        <Button
          id="consent"
          onClick={() => {
            setConsent(true);
          }}
        >
          Hell yes!
        </Button>
        <Button
          id="leave"
          onClick={() => {
            window.location.href = 'about:blank';
          }}
        >
          Not today, Satan
        </Button>
      </div>
      <a href="/words/cloud">
        <img id="eye" src={eyeLink} alt="eye" />
      </a>
    </div>
  );
};

ConsentPage.propTypes = {
  setConsent: PropTypes.func.isRequired,
};

export default ConsentPage;

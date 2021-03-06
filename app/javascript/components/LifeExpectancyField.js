import React from 'react';

const LifeExpectancyField = (props) => {
  return (
    <label>{props.label}
      <textarea
        name={props.name}
        onChange = {props.handleChange}
        type='text'
        value={props.content}
      />
    </label>
  );
}

export default LifeExpectancyField;

import React from 'react';

const ImgUrlField = (props) => {
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

export default ImgUrlField;

import React from "react";

const styles = {
  wrapper: {
    margin: 8,
    padding: 8,
    display: "flex",
    flexDirection: "row",
    border: "1px solid grey",
    borderRadius: 16,
  },
  imageContainer: {},
  image: {
    width: 50,
    height: 50,
    borderRadius: 25,
  },
  contentContainer: {
    marginLeft: 8,
    display: "flex",
    flexDirection: "column",
    justifyContent: "center",
  },
  nameText: {
    color: "black",
    fontSize: 16,
    fontWeight: "bold",
  },
  commentText: {
    color: "black",
    fontSize: 16,
  },
};

function Comment(props) {
  return (
    <div style={styles.wrapper}>
      <div style={styles.iimageContainer}>
        <img
          src="https://upload.wikimedia.org/wikipedia/com/8/89/portrait_placeholdeer.png"
          style={styles.iimage}
        />
        <div style={styles.contentContainer}>
          <span style={styles.nameText}>{props.name}</span>
          <span style={styles.commentText}>{props.Comment}</span>
        </div>
      </div>
    </div>
  );
}

export default Comment;

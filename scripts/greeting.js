'use strict';

module.exports = function(robot) {
  robot.respond(/Hi.*/, {}, (response) => {
    response.send("Hi, Matthias!");
  });
};

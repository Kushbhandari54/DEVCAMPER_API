//@desc    Get all bootcamps
//@route   Get /api/v1/bootcamps
//@access  Public
exports.getBootcamps = (req, res, next) => {
  res.status(200).json({ success: true, message: "Show all bootcamps" });
};

//@desc    Get One bootcamp
//@route   Get /api/v1/bootcamps/:id
//@access  Public
exports.getBootcamp = (req, res, next) => {
  res
    .status(200)
    .send({ success: true, message: `Show bootcamps ${req.params.id}` });
};

//@desc    Create bootcamp
//@route   POST /api/v1/bootcamps
//@access  Private
exports.createBootcamp = (req, res, next) => {
  res.status(200).json({ success: true, message: "Create new bootcamp" });
};

//@desc    Update bootcamp
//@route   PUT /api/v1/bootcamps/:id
//@access  Private
exports.updateBootcamp = (req, res, next) => {
  res
    .status(200)
    .json({ status: 200, message: `Update bootcamp ${req.params.id}` });
};

//@desc    Delete bootcamp
//@route   DELETE /api/v1/bootcamps/:id
//@access  Private
exports.deleteBootcamp = (req, res, next) => {
  res
    .status(200)
    .json({ success: true, message: `Delete bootcamp ${req.params.id}` });
};

<?php

class ClickData
{
    /**
     * @var string City user is searching for
     */
    public $city;

    /**
     * @var string Date user is checking in. Format MM/DD/YYYY
     */
    public $checkInDate;
    /**
     * @var string Date user is checking out. Format MM/DD/YYYY
     */
    public $checkOutDate;

    /**
     * @var int Number of guests who are traveling
     */
    public $guests;
    /**
     * @var int Number of rooms being booked
     */
    public $rooms;

    /**
     * @var string Code used in deep-link for tracking purposes
     */
    public $trackingID;
}
                                                                                              

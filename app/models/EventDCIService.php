<?php 

    use Illuminate\Database\Eloquent\Model as Eloquent;
    use Illuminate\Database\Eloquent\Relations\Pivot;

    class EventDCIService extends Pivot {

        /*
         * The database table used by the model.
         */
        protected $table = 'event_service';

        /*
         * The primary key on the table on the database
         */
        protected $primaryKey = 'id';

        /*
         * Many events/service belongs to an event
         */
        public function event() {
            return $this->belongsTo('EventDCI');
        }

        /*
         * Many events/service belongs to an service
         */
        public function service() {
            return $this->belongsTo('Service');
        }

        /*
         * EventDCIService has many tasks
         */
        public function tasks() {
            return $this->hasMany('Task', 'event_service_id', 'id');
        }

    }
#!/usr/bin/env python

# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import argparse

from google.cloud import pubsub_v1


def alert_algorithm(message):
    #Dummy vars
    magros = 150
    i = 30
    alert_flag = 1 #1 for aactive alert and 0 for inactive alert
    last_record = None #Last record should be a database query
    while i > 0: #Change this loop for the times stamp
        
        #Check if the data is empty
        if message.attributes:
            '''
            First Scenario
            '''
            #check the magros
            if magros > 100:
                print('Alerta Interna, posible nave')
                if i > 0:
                    print('Save message in the data base')
                    continue
                else:
                    print('ALERTA GLOBAL DEFINITIVAMENTE ES UNA NAVE ENEMIGA')
                    
                       
            else:
                if alert_flag == 1:
                    print('Cancelling alert')
                    alert_flag = 0
                    break
                else:    
                    print('Save message in the data base')
                    continue
        
        else:
            '''
            Second Scenario
            '''
            #check if the latest record was null
            if last_record:
                print('Save message in the database')
                
            else:
                print('Alerta interna')
                if i > 0:
                    print('Save message in the database and continue')
                    #continue
                else:
                    print('ALERTA A MANTENIMIENTO EL SENSOR ESTA FALLANDO')

        i -= 1


def sub(project_id, subscription_id, timeout=None):
    """Receives messages from a Pub/Sub subscription."""
    # Initialize a Subscriber client
    subscriber_client = pubsub_v1.SubscriberClient()
    # Create a fully qualified identifier in the form of
    # `projects/{project_id}/subscriptions/{subscription_id}`
    subscription_path = subscriber_client.subscription_path(project_id, subscription_id)

    def callback(message):
        print(f"Received {message}.")
        # Acknowledge the message. Unack'ed messages will be redelivered.
        message.ack()
        print(f"Acknowledged {message.message_id}.")
        print('*****LETS TEST*****')
        print(message.attributes)
        # if message.attributes:
        #     print('Hay algo')

        # else:
        #     print('Empty attributes')
        alert_algorithm(message)

    streaming_pull_future = subscriber_client.subscribe(
        subscription_path, callback=callback
    )
    print(f"Listening for messages on {subscription_path}..\n")

    try:
        # Calling result() on StreamingPullFuture keeps the main thread from
        # exiting while messages get processed in the callbacks.
        streaming_pull_future.result(timeout=timeout)
    except:  # noqa
        streaming_pull_future.cancel()  # Trigger the shutdown.
        streaming_pull_future.result()  # Block until the shutdown is complete.

    subscriber_client.close()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument("project_id", help="Google Cloud project ID")
    parser.add_argument("subscription_id", help="Pub/Sub subscription ID")
    parser.add_argument(
        "timeout", default=None, nargs="?", const=1, help="Pub/Sub subscription ID"
    )

    args = parser.parse_args()

    sub(args.project_id, args.subscription_id, args.timeout)
/*
  # Add Generated Video URL Field to content_drafts Table

  ## Overview
  This migration adds a field to store the AI-generated video URL returned from the n8n webhook response.

  ## Changes
  
  ### Modified Tables
  
  #### `content_drafts`
  - `generated_video_url` (text, nullable) - The URL of the AI-generated video returned from webhook

  ## Important Notes
  1. This field will be null when the draft is first created
  2. It will be populated when the webhook returns the generated video content
  3. Users can view and update this field via RLS policies already in place
*/

-- Add generated_video_url field to content_drafts table
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'content_drafts' AND column_name = 'generated_video_url'
  ) THEN
    ALTER TABLE content_drafts ADD COLUMN generated_video_url text;
  END IF;
END $$;
